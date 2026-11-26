import 'package:flutter/material.dart';
import 'package:iptvmac/app/update_manager.dart';

class UpdateScheduleSettings extends StatelessWidget {
  const UpdateScheduleSettings({super.key, required this.manager});

  final UpdateManager manager;

  bool use24(BuildContext context) {
    if (manager.timeFormat == '24') return true;
    if (manager.timeFormat == '12') return false;
    return MediaQuery.of(context).alwaysUse24HourFormat;
  }

  String formatTime(BuildContext context, int hour, int minute) {
    return MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay(hour: hour, minute: minute),
      alwaysUse24HourFormat: use24(context),
    );
  }

  String formatDateTime(BuildContext context, DateTime date) {
    final local = date.toLocal();

    return '${MaterialLocalizations.of(context).formatMediumDate(local)} '
        '${formatTime(context, local.hour, local.minute)}';
  }

  Future<void> pickTime(BuildContext context, bool notification) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: notification ? manager.notificationHour : manager.checkHour,
        minute: notification ? manager.notificationMinute : manager.checkMinute,
      ),
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(alwaysUse24HourFormat: use24(context)),
        child: child!,
      ),
    );

    if (selected == null) return;

    await manager.schedulePreference(
      notification ? 'notificationHour' : 'checkHour',
      selected.hour,
    );

    await manager.schedulePreference(
      notification ? 'notificationMinute' : 'checkMinute',
      selected.minute,
    );
  }

  Future<void> pickDate(
    BuildContext context, [
    bool notification = false,
  ]) async {
    final now = DateTime.now();
    final first = DateTime(now.year, now.month, now.day);
    final last = DateTime(now.year + 5, now.month, now.day);

    var initial =
        DateTime.tryParse(
          (notification ? manager.notificationDate : manager.checkDate) ?? '',
        ) ??
        first;

    if (initial.isBefore(first) || initial.isAfter(last)) {
      initial = first;
    }

    final selected = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: last,
    );

    if (selected == null) return;

    await manager.schedulePreference(
      notification ? 'notificationDate' : 'checkDate',
      selected.toIso8601String(),
    );
  }

  Widget weekdays(BuildContext context, bool notification) {
    final m = manager;
    final mask = notification ? m.notificationDays : m.checkDays;

    final names = MaterialLocalizations.of(context).narrowWeekdays;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var i = 0; i < 7; i++)
          FilterChip(
            label: Text(names[(i + 1) % 7]),
            selected: (mask & (1 << i)) != 0,
            onSelected: (selected) {
              final next = selected ? mask | (1 << i) : mask & ~(1 << i);

              m.schedulePreference(
                notification ? 'notificationDays' : 'checkDays',
                next,
              );
            },
          ),
      ],
    );
  }

  Widget monthly(BuildContext context, bool notification) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      option(
        context,
        'Day of month',
        '1',
        '${manager.monthDay(notification)}',
        {for (var day = 1; day <= 31; day++) '$day': '$day'},
        (v) => manager.schedulePreference(
          notification ? 'notificationMonthDay' : 'checkMonthDay',
          int.parse(v),
        ),
      ),
      const Text('If this day does not exist, use the final day of the month.'),
    ],
  );

  Widget option(
    BuildContext context,
    String title,
    String value,
    String selected,
    Map<String, String> choices,
    ValueChanged<String> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        initialValue: choices.containsKey(selected) ? selected : value,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: title,
          border: const OutlineInputBorder(),
        ),
        items: [
          for (final item in choices.entries)
            DropdownMenuItem(
              value: item.key,
              child: Text(item.value, overflow: TextOverflow.ellipsis),
            ),
        ],
        onChanged: (v) {
          if (v != null) onChanged(v);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: manager,
      builder: (context, _) {
        final m = manager;
        final next = m.nextScheduledCheck;
        final last = m.lastSuccess;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(),
            Text(
              'Update Schedule Manager',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Device local time: ${DateTime.now().timeZoneName}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            option(context, 'Time format', 'device', m.timeFormat, const {
              'device': 'Follow device settings',
              '12': '12-hour (AM/PM)',
              '24': '24-hour',
            }, (v) => m.schedulePreference('timeFormat', v)),
            if (!m.automatic && !m.scheduled)
              Text(
                'Not recommended: automatic update checks are disabled.',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            Text('Current checking mode: ${m.checkingMode}'),
            SwitchListTile(
              title: const Text('Catch up missed checks'),
              value: m.catchUp,
              onChanged: (v) => m.preference('catchUp', v),
            ),
            if (m.scheduled) ...[
              option(
                context,
                'Update check schedule',
                'interval',
                m.scheduleMode,
                const {
                  'interval': 'Every selected number of hours',
                  'daily': 'Daily',
                  'weekly': 'Selected days of the week',
                  'monthly': 'Monthly',
                  'date': 'Specific calendar date',
                },
                (v) => m.schedulePreference('scheduleMode', v),
              ),
              if (m.scheduleMode != 'interval')
                ListTile(
                  title: const Text('Scheduled check time'),
                  subtitle: Text(
                    formatTime(context, m.checkHour, m.checkMinute),
                  ),
                  trailing: const Icon(Icons.access_time),
                  onTap: () => pickTime(context, false),
                ),
              if (m.scheduleMode == 'weekly') weekdays(context, false),
              if (m.scheduleMode == 'monthly') monthly(context, false),
              if (m.scheduleMode == 'date')
                ListTile(
                  title: const Text('Scheduled calendar date'),
                  subtitle: Text(
                    m.checkDate == null
                        ? 'Choose a date'
                        : MaterialLocalizations.of(context)
                              .formatMediumDate(DateTime.parse(m.checkDate!)),
                  ),
                  trailing: const Icon(Icons.calendar_month),
                  onTap: () => pickDate(context),
                ),
            ],
            const Divider(),
            option(
              context,
              'Notification schedule',
              'available',
              m.notificationMode,
              const {
                'available': 'When an update is available (Recommended)',
                'startup': 'At application startup',
                'scheduled': 'Custom notification schedule',
                'never': 'Never notify me',
              },
              (v) => m.schedulePreference('notificationMode', v),
            ),
            if (m.notificationMode == 'never' || !m.notifications)
              Text(
                'Not recommended: important update notifications may be missed.',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            if (m.notifications && m.notificationMode == 'scheduled') ...[
              option(
                context,
                'Notification recurrence',
                'daily',
                m.notificationRecurrence,
                const {
                  'interval': 'Custom hourly interval',
                  'daily': 'Daily',
                  'weekly': 'Weekly',
                  'monthly': 'Monthly',
                  'date': 'Specific calendar date',
                },
                (v) => m.schedulePreference('notificationRecurrence', v),
              ),
              if (m.notificationRecurrence == 'interval')
                option(
                  context,
                  'Notification interval',
                  '6',
                  '${m.notificationHours}',
                  {for (var i = 1; i <= 24; i++) '$i': '$i hours'},
                  (v) =>
                      m.schedulePreference('notificationHours', int.parse(v)),
                ),
              if (m.notificationRecurrence != 'interval')
                ListTile(
                  title: const Text('Notification time'),
                  subtitle: Text(
                    formatTime(
                      context,
                      m.notificationHour,
                      m.notificationMinute,
                    ),
                  ),
                  trailing: const Icon(Icons.access_time),
                  onTap: () => pickTime(context, true),
                ),
              if (m.notificationRecurrence == 'weekly') weekdays(context, true),
              if (m.notificationRecurrence == 'monthly') monthly(context, true),
              if (m.notificationRecurrence == 'date')
                ListTile(
                  title: const Text('Notification calendar date'),
                  subtitle: Text(m.notificationDate ?? 'Choose a date'),
                  trailing: const Icon(Icons.calendar_month),
                  onTap: () => pickDate(context, true),
                ),
            ],
            const Divider(),
            Text(
              'Last attempted check: ${m.lastAttempt == null ? 'Not checked yet' : formatDateTime(context, m.lastAttempt!)}',
            ),
            Text(
              'Last successful check: '
              '${last == null ? 'Not checked yet' : formatDateTime(context, last)}',
            ),
            const SizedBox(height: 8),
            Text(
              'Next scheduled check: '
              '${next == null ? 'Not scheduled' : formatDateTime(context, next)}',
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: m.restoreRecommendedUpdateSettings,
              child: const Text('Restore Recommended Settings'),
            ),
            const Text(
              'Manual update checks remain available. '
              'Scheduled checks run only while the application is running.',
            ),
          ],
        );
      },
    );
  }
}
