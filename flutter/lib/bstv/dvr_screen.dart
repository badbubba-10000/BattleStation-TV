// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/player/play_request.dart';
import 'package:iptvmac/ui/play.dart';

import 'core_services.dart';

import 'feature_models.dart';
import 'dvr_service.dart';

class DvrScreen extends StatefulWidget {
  const DvrScreen({super.key});
  @override
  State<DvrScreen> createState() => _DvrScreenState();
}

class _DvrScreenState extends State<DvrScreen> {
  String query = '', filter = 'all';
  bool newest = true;
  Future<void> action(Future<void> Function() work) async {
    try {
      await work();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Action failed. Check file access, schedule conflicts and stream compatibility.',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final dvr = context.watch<CoreServices>().dvr;
    var jobs = dvr.jobs
        .where(
          (j) =>
              '${j.title} ${j.channelName}'.toLowerCase().contains(
                query.toLowerCase(),
              ) &&
              (filter == 'all' || j.state.name == filter),
        )
        .toList();
    jobs.sort(
      (a, b) =>
          newest ? b.start.compareTo(a.start) : a.start.compareTo(b.start),
    );
    final bytes = dvr.jobs.fold<int>(0, (sum, j) => sum + j.bytes);
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 160),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Wrap(
                spacing: 10,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    'DVR • ${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB captured',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  FilledButton(
                    onPressed: () => scheduleDialog(context),
                    child: const Text('Record / Schedule'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => action(() async {
                      final path = await FilePicker.getDirectoryPath();
                      if (path != null && !path.startsWith('content:')) {
                        dvr.directory = path;
                      }
                    }),
                    icon: const Icon(Icons.folder),
                    label: const Text('Recording folder'),
                  ),
                  OutlinedButton(
                    onPressed: () => action(() async {
                      await Directory(dvr.directory).create(recursive: true);
                      final free = await dvr.freeSpace(dvr.directory);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${(free / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB available • ${(dvr.minimumFreeBytes / (1024 * 1024)).round()} MB reserved',
                            ),
                          ),
                        );
                      }
                    }),
                    child: const Text('Check storage'),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Search recordings',
                      ),
                      onChanged: (v) => setState(() => query = v),
                    ),
                  ),
                  TextButton(
                    onPressed: () => recordingSettings(context, dvr),
                    child: const Text('Storage settings'),
                  ),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: filter,
                    items: [
                      const DropdownMenuItem(
                        value: 'all',
                        child: Text('All states'),
                      ),
                      for (final state in RecordingState.values)
                        DropdownMenuItem(
                          value: state.name,
                          child: Text(state.name),
                        ),
                    ],
                    onChanged: (v) => setState(() => filter = v!),
                  ),
                  TextButton(
                    onPressed: () => setState(() => newest = !newest),
                    child: Text(newest ? 'Newest first' : 'Oldest first'),
                  ),
                ],
              ),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 120),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    'Folder: ${dvr.directory}\nKeep BSTV running and device awake. Android background recording is unsupported. Unencrypted MPEG-TS and TS HLS only. No automatic deletion. Unknown provider limits default to one connection.',
                  ),
                  for (final rule in dvr.seriesRules)
                    ListTile(
                      title: Text('Series rule: ${rule['title']}'),
                      subtitle: Text(rule['channel']),
                      trailing: IconButton(
                        tooltip:
                            'Remove series rule and cancel its future jobs',
                        onPressed: () async {
                          final yes = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Remove series rule and cancel future recordings?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text('Remove'),
                                ),
                              ],
                            ),
                          );
                          if (yes == true) dvr.removeSeriesRule(rule['id']);
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: jobs.isEmpty
              ? const Center(
                  child: Text(
                    'No recordings match. Schedule from the guide or choose Record / Schedule.',
                  ),
                )
              : ListView.builder(
                  itemCount: jobs.length,
                  itemBuilder: (context, index) {
                    final job = jobs[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '${job.channelName} • ${job.state.name} • ${DateFormat.yMd().add_jm().format(job.start.toLocal())} – ${DateFormat.jm().format(job.end.toLocal())}',
                            ),
                            Text(
                              '${(job.bytes / (1024 * 1024)).toStringAsFixed(2)} MB • ${job.repeat.name} • padding ${job.paddingBefore}/${job.paddingAfter} min',
                            ),
                            if (job.state == RecordingState.recording)
                              LinearProgressIndicator(
                                value:
                                    (DateTime.now()
                                                .difference(job.captureStart)
                                                .inMilliseconds /
                                            job.captureEnd
                                                .difference(job.captureStart)
                                                .inMilliseconds)
                                        .clamp(0, 1),
                              ),
                            if (job.error != null) Text(job.error!),
                            if (job.path != null) SelectableText(job.path!),
                            Wrap(
                              spacing: 8,
                              children: [
                                if (job.state == RecordingState.recording)
                                  TextButton(
                                    onPressed: () => dvr.stop(job.id),
                                    child: const Text('Stop'),
                                  ),
                                if (job.state == RecordingState.scheduled) ...[
                                  TextButton(
                                    onPressed: () =>
                                        scheduleDialog(context, existing: job),
                                    child: const Text('Edit'),
                                  ),
                                  TextButton(
                                    onPressed: () => dvr.cancel(job),
                                    child: const Text('Cancel schedule'),
                                  ),
                                ],
                                if (job.terminal && job.path != null) ...[
                                  TextButton(
                                    onPressed: () => action(() async {
                                      if (!await File(job.path!).exists()) {
                                        throw const FileSystemException(
                                          'Recording missing',
                                        );
                                      }
                                      if (context.mounted) {
                                        await openPlayer(
                                          context,
                                          PlayRequest(
                                            title: job.title,
                                            url: Uri.file(job.path!),
                                            isLive: false,
                                          ),
                                        );
                                      }
                                    }),
                                    child: const Text('Play'),
                                  ),
                                  TextButton(
                                    onPressed: () => action(() async {
                                      final name = TextEditingController(
                                        text: File(job.path!)
                                            .uri
                                            .pathSegments
                                            .last,
                                      );
                                      final accepted = await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                            'Rename recording file',
                                          ),
                                          content: TextField(controller: name),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, true),
                                              child: const Text('Rename'),
                                            ),
                                          ],
                                        ),
                                      );
                                      final text = name.text.trim();
                                      name.dispose();
                                      if (accepted == true &&
                                          text.isNotEmpty &&
                                          !RegExp(r'[<>:"/\\|?*]')
                                              .hasMatch(text) &&
                                          text != '.' &&
                                          text != '..') {
                                        await dvr.move(
                                          job,
                                          '${File(job.path!).parent.path}/$text',
                                        );
                                      }
                                    }),
                                    child: const Text('Rename'),
                                  ),
                                  TextButton(
                                    onPressed: () => action(() async {
                                      final folder =
                                          await FilePicker.getDirectoryPath();
                                      if (folder != null &&
                                          !folder.startsWith('content:')) {
                                        await dvr.move(
                                          job,
                                          '$folder/${File(job.path!).uri.pathSegments.last}',
                                        );
                                      }
                                    }),
                                    child: const Text('Move'),
                                  ),
                                  if (Platform.isWindows)
                                    TextButton(
                                      onPressed: () => launchUrl(
                                        Uri.directory(
                                          File(job.path!).parent.path,
                                        ),
                                      ),
                                      child: const Text('Open folder'),
                                    ),
                                ],
                                if (job.terminal &&
                                    job.end.isAfter(DateTime.now()))
                                  TextButton(
                                    onPressed: () => action(() async {
                                      dvr.schedule(
                                        RecordingJob(
                                          id: featureId(),
                                          accountId: job.accountId,
                                          channelKey: job.channelKey,
                                          channelName: job.channelName,
                                          title: job.title,
                                          start: DateTime.now(),
                                          end: job.end,
                                          directory: dvr.directory,
                                        ),
                                      );
                                    }),
                                    child: const Text('Retry remaining'),
                                  ),
                                if (job.terminal)
                                  TextButton(
                                    onPressed: () => action(() async {
                                      final yes = await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                            'Delete recording and its file?',
                                          ),
                                          content: const Text(
                                            'This permanently removes the captured media, including a partial file if present.',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, true),
                                              child: const Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      );
                                      if (yes == true) {
                                        await dvr.delete(job, deleteFile: true);
                                      }
                                    }),
                                    child: const Text('Delete'),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

Future<void> recordingSettings(BuildContext context, DvrService dvr) async {
  final reserve = TextEditingController(
    text: '${dvr.minimumFreeBytes ~/ (1024 * 1024)}',
  );
  final pattern = TextEditingController(text: dvr.filenamePattern);
  String? error;
  await showDialog<void>(
    context: context,
    builder: (dialog) => StatefulBuilder(
      builder: (dialog, update) => AlertDialog(
        title: const Text('Recording storage'),
        content: SizedBox(
          width: 480,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: reserve,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Minimum free space (MB, at least 64)',
                  ),
                ),
                TextField(
                  controller: pattern,
                  decoration: const InputDecoration(
                    labelText: 'Filename pattern',
                    helperText: '{title}, {channel}, {date} • unique ID always appended',
                  ),
                ),
                const Text(
                  'Container: MPEG-TS (.ts). No transcoding. Retention: keep until manually deleted. Automatic cleanup is disabled; no cleanup policy runs.',
                ),
                if (error != null) Text(error!),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              try {
                final mb = int.parse(reserve.text);
                if (mb < 64 || mb > 1024 * 1024) throw const FormatException();
                // Validate both values before changing either persisted setting.
                final value = pattern.text.trim();
                if (value.isEmpty ||
                    value.length > 120 ||
                    RegExp(r'[{}]').hasMatch(
                      value
                          .replaceAll('{title}', '')
                          .replaceAll('{channel}', '')
                          .replaceAll('{date}', ''),
                    )) {
                  throw const FormatException();
                }
                dvr.filenamePattern = value;
                dvr.minimumFreeBytes = mb * 1024 * 1024;
                Navigator.pop(dialog);
              } on FormatException {
                update(
                  () => error = 'Enter a reserve of 64–1048576 MB and use only the listed placeholders.',
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ),
  );
  reserve.dispose();
  pattern.dispose();
}

Future<void> scheduleDialog(
  BuildContext context, {
  RecordingJob? existing,
  Item? selectedChannel,
}) async {
  final library = context.read<LibraryModel>();
  final channels = library.db.read(
    (db) => Item.fromRows(
      db.select('SELECT * FROM item WHERE type=? ORDER BY name', ['live']),
    ),
  );
  if (channels.isEmpty) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Add a live playlist first')));
    return;
  }
  await showDialog<void>(
    context: context,
    builder: (_) => _ScheduleDialog(
      channels: channels, existing: existing, selectedChannel: selectedChannel,
    ),
  );
}

class _ScheduleDialog extends StatefulWidget {
  const _ScheduleDialog({required this.channels, this.existing, this.selectedChannel});
  final List<Item> channels;
  final RecordingJob? existing;
  final Item? selectedChannel;
  @override
  State<_ScheduleDialog> createState() => _ScheduleDialogState();
}

class _ScheduleDialogState extends State<_ScheduleDialog> {
  late Item channel;
  late DateTime start, end;
  late TextEditingController title;
  int before = 0, after = 0;
  RecordingRepeat repeat = RecordingRepeat.none;
  String? error;
  @override
  void initState() {
    super.initState();
    final job = widget.existing;
    channel =
        widget.channels
            .where((c) => channelKey(c) == (job?.channelKey ?? (widget.selectedChannel == null ? null : channelKey(widget.selectedChannel!))))
            .firstOrNull ??
        widget.channels.first;
    start = job?.start.toLocal() ?? DateTime.now();
    end = job?.end.toLocal() ?? start.add(const Duration(hours: 1));
    title = TextEditingController(text: job?.title ?? 'Manual recording');
    before = job?.paddingBefore ?? 0;
    after = job?.paddingAfter ?? 0;
    repeat = job?.repeat ?? RecordingRepeat.none;
  }

  @override
  void dispose() {
    title.dispose();
    super.dispose();
  }

  Future<void> choose(bool beginning) async {
    final initial = beginning ? start : end;
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 366)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initial),
    );
    if (time != null) {
      setState(() {
        final value = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        if (beginning) {
          start = value;
        } else {
          end = value;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(
      widget.existing == null ? 'Record / Schedule' : 'Edit recording',
    ),
    content: SizedBox(
      width: 500,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Autocomplete<Item>(
              initialValue: TextEditingValue(text: channel.name),
              displayStringForOption: (c) => c.name,
              optionsBuilder: (text) => widget.channels
                  .where(
                    (c) =>
                        c.name.toLowerCase().contains(text.text.toLowerCase()),
                  )
                  .take(100),
              onSelected: (c) => channel = c,
            ),
            TextField(
              controller: title,
              decoration: const InputDecoration(labelText: 'Recording title'),
            ),
            ListTile(
              title: const Text('Start'),
              subtitle: Text(DateFormat.yMd().add_jm().format(start)),
              onTap: () => choose(true),
            ),
            ListTile(
              title: const Text('End'),
              subtitle: Text(DateFormat.yMd().add_jm().format(end)),
              onTap: () => choose(false),
            ),
            DropdownButton<RecordingRepeat>(
              value: repeat,
              items: [
                for (final r in RecordingRepeat.values)
                  DropdownMenuItem(value: r, child: Text('Repeat: ${r.name}')),
              ],
              onChanged: (r) => setState(() => repeat = r!),
            ),
            Row(
              children: [
                const Text('Padding before / after: '),
                DropdownButton<int>(
                  value: before,
                  items: [
                    for (final n in {0, 1, 2, 5, 10, 15, 30, before})
                      DropdownMenuItem(value: n, child: Text('$n min')),
                  ],
                  onChanged: (n) => setState(() => before = n!),
                ),
                const Text(' / '),
                DropdownButton<int>(
                  value: after,
                  items: [
                    for (final n in {0, 1, 2, 5, 10, 15, 30, after})
                      DropdownMenuItem(value: n, child: Text('$n min')),
                  ],
                  onChanged: (n) => setState(() => after = n!),
                ),
              ],
            ),
            const Text(
              'App must remain running and device awake. No automatic background wake-up. Only compatible unencrypted streams can be recorded.',
            ),
            if (error != null) Text(error!),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () {
          try {
            final dvr = context.read<CoreServices>().dvr;
            dvr.schedule(
              RecordingJob(
                id: widget.existing?.id ?? featureId(),
                accountId: channel.accountId,
                channelKey: channelKey(channel),
                channelName: channel.name,
                title: title.text.trim().isEmpty
                    ? channel.name
                    : title.text.trim(),
                start: start,
                end: end,
                directory: widget.existing?.directory ?? dvr.directory,
                repeat: repeat,
                paddingBefore: before,
                paddingAfter: after,
              ),
            );
            Navigator.pop(context);
          } catch (_) {
            setState(
              () => error = 'Invalid time range or provider connection conflict. Choose an end in the future within 24 hours of the start.',
            );
          }
        },
        child: const Text('Save'),
      ),
    ],
  );
}
