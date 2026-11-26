// Cross-platform local Easter eggs and appearance unlocks. GPLv3.
// Intentionally stores only local achievement identifiers, never credentials.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/bstv/identity.dart';
import 'package:iptvmac/bstv/theme_package.dart';

bool get getEtvEdition => BstvIdentity.name == 'GET ETV';

class UnlockReward {
  const UnlockReward(this.id, this.title, this.hint, this.accent);
  final String id, title, hint;
  final int accent;
}

List<UnlockReward> get unlockRewards => getEtvEdition
    ? const [
        UnlockReward('logo', 'Deep Sea Sonar', 'The insignia has a hidden rhythm.', 0xFF008FAD),
        UnlockReward('sequence', 'Submarine Command', 'A classic directional command ends with two selections.', 0xFF18477A),
        UnlockReward('credits', 'Seabee Gold & Navy', 'Give the people behind the software some attention.', 0xFFD1A51B),
        UnlockReward('popcorn', 'Vintage Navy TV', 'The nameplate may be hiding a broadcast.', 0xFF657C86),
        UnlockReward('master', 'Fleet Commander', 'Discover all four secrets.', 0xFFDAAD39),
      ]
    : const [
        UnlockReward('logo', 'Neon Overdrive', 'The insignia has a hidden rhythm.', 0xFFED37B7),
        UnlockReward('sequence', 'Command Center', 'A classic directional command ends with two selections.', 0xFF13C7F6),
        UnlockReward('credits', 'Retro CRT', 'Give the people behind the software some attention.', 0xFF43C774),
        UnlockReward('popcorn', 'Movie Theater', 'The nameplate may be hiding a broadcast.', 0xFFE29A27),
        UnlockReward('master', 'Master Command', 'Discover all four secrets.', 0xFF9A4FEA),
      ];

class UnlockProgress extends ChangeNotifier {
  UnlockProgress._();
  static final UnlockProgress instance = UnlockProgress._();
  final Set<String> _unlocked = <String>{};
  bool _loaded = false;
  String get storageKey => '${BstvIdentity.applicationId}.appearance_unlocks.v1';
  bool has(String id) => _unlocked.contains(id) || (id == 'master' && coreCount == 4);
  int get coreCount => _unlocked.where((id) => id != 'master' && const ['logo', 'sequence', 'credits', 'popcorn'].contains(id)).length;
  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _unlocked.addAll((prefs.getStringList(storageKey) ?? const <String>[])
        .where((id) => const ['logo', 'sequence', 'credits', 'popcorn', 'master'].contains(id)));
    _loaded = true;
    notifyListeners();
  }
  Future<bool> unlock(String id) async {
    if (!const ['logo', 'sequence', 'credits', 'popcorn'].contains(id)) return false;
    await load();
    if (!_unlocked.add(id)) return false;
    if (coreCount == 4) _unlocked.add('master');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(storageKey, _unlocked.toList()..sort());
    notifyListeners();
    return true;
  }
}

Future<void> showUnlockFeedback(BuildContext context, String id) async {
  final newlyUnlocked = await UnlockProgress.instance.unlock(id);
  if (!context.mounted || !newlyUnlocked) return;
  final reward = unlockRewards.firstWhere((reward) => reward.id == id);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Secret discovered! ${reward.title} unlocked in Customization Studio.'),
    duration: const Duration(seconds: 5),
  ));
  if (UnlockProgress.instance.coreCount == 4) {
    await showDialog<void>(context: context, builder: (dialog) => AlertDialog(
      title: const Text('Master unlockable discovered!'),
      content: Text('${unlockRewards.last.title} is now available in Customization Studio → Unlockables.'),
      actions: [TextButton(onPressed: () => Navigator.pop(dialog), child: const Text('Excellent'))],
    ));
  }
}

/// About-page interaction points work with mouse, touch, and TV D-pad OK.
class SecretTapTarget extends StatefulWidget {
  const SecretTapTarget({super.key, required this.id, required this.count, required this.child, this.onRegularTap});
  final String id;
  final int count;
  final Widget child;
  final VoidCallback? onRegularTap;
  @override
  State<SecretTapTarget> createState() => _SecretTapTargetState();
}
class _SecretTapTargetState extends State<SecretTapTarget> {
  int taps = 0;
  DateTime? lastTap;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () {
      final now = DateTime.now();
      if (lastTap == null || now.difference(lastTap!) > const Duration(seconds: 6)) taps = 0;
      lastTap = now;
      taps++;
      if (taps >= widget.count) {
        taps = 0;
        if (widget.id == 'sequence') {
          Navigator.push(context, MaterialPageRoute<void>(builder: (_) => const SecretSignalSequenceScreen()));
        } else {
          showUnlockFeedback(context, widget.id);
        }
      } else {
        widget.onRegularTap?.call();
      }
    },
    child: widget.child,
  );
}

class SecretSignalSequenceScreen extends StatefulWidget {
  const SecretSignalSequenceScreen({super.key});
  @override
  State<SecretSignalSequenceScreen> createState() => _SecretSignalSequenceScreenState();
}
class _SecretSignalSequenceScreenState extends State<SecretSignalSequenceScreen> {
  static const expected = ['up','up','down','down','left','right','left','right','select','select'];
  final List<String> inputs = [];
  final FocusNode focusNode = FocusNode();
  @override
  void dispose() { focusNode.dispose(); super.dispose(); }
  void enter(String input) {
    inputs.add(input);
    if (inputs.length > expected.length) inputs.removeAt(0);
    if (inputs.length == expected.length) {
      if (List.generate(expected.length, (i) => inputs[i] == expected[i]).every((x) => x)) {
        inputs.clear();
        showUnlockFeedback(context, 'sequence');
      } else if (inputs.length == expected.length) {
        inputs.removeAt(0);
      }
    }
    if (mounted) setState(() {});
  }
  void onKey(KeyEvent event) {
    if (event is! KeyDownEvent) return;
    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowUp) enter('up');
    if (key == LogicalKeyboardKey.arrowDown) enter('down');
    if (key == LogicalKeyboardKey.arrowLeft) enter('left');
    if (key == LogicalKeyboardKey.arrowRight) enter('right');
    // Some TV remotes report Enter, others Select. On-screen SELECT is universal.
    if (key == LogicalKeyboardKey.enter || key == LogicalKeyboardKey.select) enter('select');
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Signal calibration')),
    body: KeyboardListener(
      focusNode: focusNode,
      autofocus: true,
      onKeyEvent: onKey,
      child: Center(child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: ListView(shrinkWrap: true, padding: const EdgeInsets.all(24), children: [
          const Icon(Icons.radar, size: 62),
          const SizedBox(height: 16),
          const Text('Restore the lost signal by entering the secret directional sequence.', textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text('Signal received: ${inputs.length} steps', textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Center(child: IconButton.filledTonal(icon: const Icon(Icons.keyboard_arrow_up), tooltip: 'Up', onPressed: () => enter('up'))),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton.filledTonal(icon: const Icon(Icons.keyboard_arrow_left), tooltip: 'Left', onPressed: () => enter('left')),
            const SizedBox(width: 32),
            IconButton.filledTonal(icon: const Icon(Icons.keyboard_arrow_right), tooltip: 'Right', onPressed: () => enter('right')),
          ]),
          Center(child: IconButton.filledTonal(icon: const Icon(Icons.keyboard_arrow_down), tooltip: 'Down', onPressed: () => enter('down'))),
          const SizedBox(height: 12),
          Center(child: FilledButton(onPressed: () => enter('select'), child: const Text('SELECT / OK'))),
          const SizedBox(height: 12),
          TextButton(onPressed: () => setState(inputs.clear), child: const Text('Reset sequence')),
          const Text('Use the on-screen buttons on phones and TV remotes; arrow keys work with a keyboard.', textAlign: TextAlign.center),
        ]),
      )),
    ),
  );
}

class UnlockablesScreen extends StatefulWidget {
  const UnlockablesScreen({super.key});
  @override
  State<UnlockablesScreen> createState() => _UnlockablesScreenState();
}
class _UnlockablesScreenState extends State<UnlockablesScreen> {
  @override
  void initState() { super.initState(); UnlockProgress.instance.load(); }
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: UnlockProgress.instance,
    builder: (context, _) {
      final progress = UnlockProgress.instance;
      return ListView(padding: const EdgeInsets.all(18), children: [
        Text('Unlockables', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        const Text('Discover Easter eggs around the app to unlock exclusive appearance colors. Unlocks stay on this device and are separate for each app.'),
        const SizedBox(height: 12),
        LinearProgressIndicator(value: progress.coreCount / 4),
        const SizedBox(height: 8),
        Text('${progress.coreCount} / 4 secrets discovered'),
        const SizedBox(height: 12),
        for (final reward in unlockRewards) Card(child: ListTile(
          leading: Icon(progress.has(reward.id) ? Icons.verified : Icons.lock_outline),
          title: Text(progress.has(reward.id) ? reward.title : 'Locked reward'),
          subtitle: Text(progress.has(reward.id) ? 'Unlocked • ${reward.title}' : reward.hint),
          trailing: progress.has(reward.id) ? FilledButton.tonal(
            onPressed: () => _apply(context, reward), child: const Text('Apply'),
          ) : null,
        )),
        const SizedBox(height: 12),
        const Text('Hints: check About, the logo and nameplate. One signal is a directional puzzle. Easter eggs never run during fullscreen playback.'),
      ]);
    },
  );
  Future<void> _apply(BuildContext context, UnlockReward reward) async {
    if (!UnlockProgress.instance.has(reward.id)) return;
    final model = context.read<LibraryModel>();
    final old = model.prefs.bstvTheme;
    try {
      await model.applyBstvTheme(BstvThemePackage(
        appearance: 'dark', accentArgb: reward.accent,
        dashboardOrder: old.dashboardOrder,
        hiddenWidgets: old.hiddenWidgets,
        layouts: old.layouts,
        editor: old.editor,
        interface: old.interface,
      ));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${reward.title} appearance applied.')),
      );
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not apply appearance. Your previous layout was kept.')),
      );
      }
    }
  }
}
