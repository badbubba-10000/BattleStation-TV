import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iptvmac/app/update_manager.dart';
import 'package:iptvmac/core/release_update.dart';
import 'package:iptvmac/ui/update_schedule_settings.dart';

import 'release_update_test.dart' as fixtures;

void main() {
  late SharedPreferences prefs;
  late UpdateManager manager;
  late DateTime now;
  late int requests;
  UpdateManager create() => UpdateManager(
    storage: prefs,
    platform: 'windows',
    installedVersion: '2.4.0+7',
    clock: () => now,
    host: fixtures.FakeInstallHost(Directory.systemTemp),
    client: ReleaseClient(
      identity: UpdateIdentity.bstv,
      client: MockClient((request) async {
        requests++;
        expect(
          request.url.host,
          'api.github.com',
          reason: 'checks never download packages',
        );
        return http.Response(jsonEncode(fixtures.fixture()), 200);
      }),
    ),
  );
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    now = DateTime(2026, 11, 25, 8);
    requests = 0;
    manager = create();
  });
  tearDown(() => manager.dispose());

  test(
    'recommended defaults: startup only, no schedule or automatic downloads',
    () async {
      expect(manager.automatic, isTrue);
      expect(manager.scheduled, isFalse);
      expect(manager.nextScheduledCheck, isNull);
      await manager.check(scheduledCheck: true);
      expect(requests, 0);
      await manager.check(startup: true);
      expect(requests, 1);
      expect(manager.autoDownload, isFalse);
      await manager.preference(
        'download',
        true,
      ); // obsolete persisted option cannot re-enable downloads
      await manager.check(manual: true);
      expect(requests, 2);
      expect(manager.phase, UpdatePhase.available);
    },
  );
  test(
    'schedule only and disabled automatic modes retain manual checking',
    () async {
      await manager.preference('automatic', false);
      await manager.preference('scheduled', true);
      await manager.schedulePreference('scheduleMode', 'daily');
      now = DateTime(2026, 11, 25, 9);
      await manager.check(startup: true);
      expect(requests, 0);
      await manager.check(scheduledCheck: true);
      expect(requests, 1);
      await manager.preference('scheduled', false);
      now = now.add(const Duration(days: 1));
      await manager.check(startup: true);
      await manager.check(scheduledCheck: true);
      expect(requests, 1);
      await manager.check(manual: true);
      expect(requests, 2);
    },
  );
  test('combined mode startup and manual attempts do not consume calendar occurrence', () async {
    await manager.preference('scheduled', true);
    await manager.schedulePreference('scheduleMode', 'daily');
    now = DateTime(2026, 11, 25, 9);
    await manager.check(startup: true);
    await manager.check(manual: true);
    expect(manager.scheduledCheckDue, isTrue);
    await manager.check(scheduledCheck: true);
    await manager.check(scheduledCheck: true);
    expect(requests, 3);
    expect(manager.scheduledCheckDue, isFalse);
    now = DateTime(2026, 11, 26, 9);
    expect(manager.scheduledCheckDue, isTrue);
  });
  test('hourly anchor is independent of startup and manual checks and survives restart', () async {
    await manager.preference('scheduled', true);
    await manager.preference('hours', 3);
    expect(manager.nextScheduledCheck, DateTime(2026, 11, 25, 11));
    now = DateTime(2026, 11, 25, 10);
    await manager.check(manual: true);
    expect(manager.nextScheduledCheck, DateTime(2026, 11, 25, 11));
    now = DateTime(2026, 11, 25, 11);
    await manager.check(scheduledCheck: true);
    manager.dispose();
    manager = create();
    expect(manager.scheduledCheckDue, isFalse);
    expect(manager.nextScheduledCheck, DateTime(2026, 11, 25, 14));
  });
  test(
    'daily and multi-weekday schedules use local wall clock fields',
    () async {
      await manager.preference('scheduled', true);
      await manager.schedulePreference('scheduleMode', 'daily');
      await manager.schedulePreference('checkHour', 17);
      await manager.schedulePreference('checkMinute', 35);
      expect(manager.nextScheduledCheck, DateTime(2026, 11, 25, 17, 35));
      await manager.schedulePreference('scheduleMode', 'weekly');
      await manager.schedulePreference('checkDays', (1 << 0) | (1 << 4));
      expect(manager.nextScheduledCheck, DateTime(2026, 11, 27, 17, 35));
      now = DateTime(2026, 11, 27, 18);
      await manager.check(scheduledCheck: true);
      expect(manager.nextScheduledCheck, DateTime(2026, 11, 30, 17, 35));
      await manager.schedulePreference('checkDays', 0);
      expect(manager.nextScheduledCheck, isNull);
    },
  );
  test('monthly day 31 clamps to month end including leap years', () async {
    await manager.preference('scheduled', true);
    await manager.schedulePreference('scheduleMode', 'monthly');
    await manager.schedulePreference('checkMonthDay', 31);
    now = DateTime(2028, 2, 1);
    expect(manager.nextScheduledCheck, DateTime(2028, 2, 29, 9));
    now = DateTime(2027, 2, 1);
    expect(manager.nextScheduledCheck, DateTime(2027, 2, 28, 9));
    now = DateTime(2027, 4, 1);
    expect(manager.nextScheduledCheck, DateTime(2027, 4, 30, 9));
  });
  test('specific date catches up once and has no future recurrence', () async {
    await manager.preference('scheduled', true);
    await manager.schedulePreference('scheduleMode', 'date');
    await manager.schedulePreference('checkDate', '2026-11-25');
    now = DateTime(2026, 11, 27, 10);
    expect(manager.scheduledCheckDue, isTrue);
    await manager.check(scheduledCheck: true);
    expect(manager.scheduledCheckDue, isFalse);
    expect(manager.nextScheduledCheck, isNull);
  });
  test('missed catch-up can be disabled; clock rollback cannot replay consumed occurrence', () async {
    await manager.preference('scheduled', true);
    await manager.schedulePreference('scheduleMode', 'daily');
    await manager.preference('catchUp', false);
    now = DateTime(2026, 11, 25, 12);
    expect(manager.scheduledCheckDue, isFalse);
    await manager.preference('catchUp', true);
    await manager.check(scheduledCheck: true);
    now = DateTime(2026, 11, 25, 8);
    expect(manager.scheduledCheckDue, isFalse);
    now = DateTime(2026, 11, 25, 10);
    expect(manager.scheduledCheckDue, isFalse);
    now = DateTime(2026, 11, 26, 9);
    expect(manager.scheduledCheckDue, isTrue);
  });
  test(
    'notification recurrence is independent and deferred during playback',
    () async {
      await manager.preference('automatic', false);
      await manager.schedulePreference('notificationMode', 'scheduled');
      await manager.schedulePreference('notificationRecurrence', 'weekly');
      await manager.schedulePreference('notificationDays', 1 << 2);
      await manager.schedulePreference('notificationHour', 10);
      await manager.check(manual: true);
      manager.setPlaybackActive(true);
      expect(manager.showNotification, isFalse);
      now = DateTime(2026, 11, 25, 10);
      expect(manager.showNotification, isFalse);
      now = DateTime(2026, 11, 26, 7);
      manager.setPlaybackActive(false);
      expect(manager.showNotification, isTrue);
      await manager.markNotificationShown();
      expect(manager.showNotification, isFalse);
      manager.dispose();
      manager = create();
      expect(manager.showNotification, isFalse);
      now = DateTime(2026, 12, 2, 10);
      expect(manager.showNotification, isTrue);
      expect(
        requests,
        1,
        reason: 'notification schedule never discovers releases',
      );
    },
  );
  test(
    'notification hourly, monthly and date recurrence have independent fields',
    () async {
      await manager.schedulePreference('notificationMode', 'scheduled');
      await manager.schedulePreference('notificationRecurrence', 'interval');
      await manager.schedulePreference('notificationHours', 2);
      expect(
        manager.occurrence(notification: true, next: true),
        DateTime(2026, 11, 25, 10),
      );
      await manager.schedulePreference('notificationRecurrence', 'monthly');
      await manager.schedulePreference('notificationMonthDay', 31);
      expect(
        manager.occurrence(notification: true, next: true),
        DateTime(2026, 11, 30, 9),
      );
      await manager.schedulePreference('notificationRecurrence', 'date');
      await manager.schedulePreference('notificationDate', '2026-12-12');
      expect(
        manager.occurrence(notification: true, next: true),
        DateTime(2026, 12, 12, 9),
      );
      expect(manager.scheduleMode, 'interval');
      expect(manager.checkDate, isNull);
    },
  );
  test(
    'disabled notifications stay disabled through playback changes and restart',
    () async {
      await manager.check(manual: true);
      await manager.schedulePreference('notificationMode', 'never');
      manager.setPlaybackActive(true);
      manager.setPlaybackActive(false);
      expect(manager.showNotification, isFalse);
      manager.dispose();
      manager = create();
      expect(manager.notificationMode, 'never');
      expect(manager.showNotification, isFalse);
    },
  );
  test('calendar recurrence keeps wall-clock time across DST boundaries', () async {
    await manager.preference('scheduled', true);
    await manager.schedulePreference('scheduleMode', 'daily');
    now = DateTime(2027, 3, 13, 10);
    expect(manager.nextScheduledCheck, DateTime(2027, 3, 14, 9));
    now = DateTime(2027, 11, 6, 10);
    expect(manager.nextScheduledCheck, DateTime(2027, 11, 7, 9));
    expect(manager.nextScheduledCheck!.hour, 9);
  });
  test('startup notification is independent of startup checking and defers playback', () async {
    await manager.check(manual: true);
    await manager.preference('automatic', false);
    await manager.schedulePreference('notificationMode', 'startup');
    expect(manager.showNotification, isFalse);
    manager.setPlaybackActive(true);
    manager.start();
    await Future<void>.delayed(const Duration(milliseconds: 1));
    expect(manager.showNotification, isFalse);
    manager.setPlaybackActive(false);
    expect(manager.showNotification, isTrue);
    await manager.markNotificationShown();
    expect(manager.showNotification, isFalse);
    expect(requests, 1);
  });
  test('notification clock rollback does not replay a previous occurrence', () async {
    await manager.schedulePreference('notificationMode', 'scheduled');
    await manager.check(manual: true);
    now = DateTime(2026, 11, 26, 10);
    expect(manager.showNotification, isTrue);
    await manager.markNotificationShown();
    now = DateTime(2026, 11, 25, 10);
    expect(manager.showNotification, isFalse);
    now = DateTime(2026, 11, 26, 11);
    expect(manager.showNotification, isFalse);
    now = DateTime(2026, 11, 27, 10);
    expect(manager.showNotification, isTrue);
  });
  test('overlapping requests are rejected before network access', () async {
    final gate = Completer<http.Response>();
    var calls = 0;
    final other = UpdateManager(
      storage: prefs,
      platform: 'windows',
      installedVersion: '2.4.0+7',
      host: fixtures.FakeInstallHost(Directory.systemTemp),
      client: ReleaseClient(
        identity: UpdateIdentity.bstv,
        client: MockClient((_) {
          calls++;
          return gate.future;
        }),
      ),
    );
    final pending = other.check(manual: true);
    await other.check(manual: true);
    expect(calls, lessThanOrEqualTo(1));
    gate.complete(http.Response(jsonEncode(fixtures.fixture()), 200));
    await pending;
    expect(calls, 1);
    other.dispose();
  });
  testWidgets(
    '12/24-hour display preserves scheduled time and restart preferences',
    (tester) async {
      await manager.preference('scheduled', true);
      await manager.schedulePreference('scheduleMode', 'daily');
      await manager.schedulePreference('checkHour', 17);
      await manager.schedulePreference('checkMinute', 35);
      final target = manager.nextScheduledCheck;
      String displayed = '';
      Future<void> render() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                displayed = UpdateScheduleSettings(
                  manager: manager,
                ).formatTime(context, manager.checkHour, manager.checkMinute);
                return Text(displayed);
              },
            ),
          ),
        );
      }

      await manager.schedulePreference('timeFormat', '12');
      await render();
      expect(displayed, contains('PM'));
      await manager.schedulePreference('timeFormat', '24');
      await render();
      expect(displayed, '17:35');
      expect(manager.nextScheduledCheck, target);
      manager.dispose();
      manager = create();
      expect(manager.timeFormat, '24');
      expect(manager.nextScheduledCheck, target);
    },
  );
}
