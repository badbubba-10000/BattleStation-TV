// BattleStation TV / GET ETV - optional interactive, local-only guided tour.
// GPLv3 modification, 2026-11-24.
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A single in-app entry point for replay. No accounts or network traffic.
class TourService {
  TourService._();
  static final replay = ValueNotifier<int>(0);
  static Future<bool> shouldOffer(String id) async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool('guided_tour_v1_$id') ?? false);
  }
  static Future<void> remember(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('guided_tour_v1_$id', true);
  }
  static void requestReplay() => replay.value++;
}

/// Actual UI anchor keys, attached to widgets in both branded applications.
class TourAnchors {
  TourAnchors._();
  static final nav = List.generate(10, (_) => GlobalKey());
  static final search = GlobalKey();
  static final customize = {
    for (final label in ['Interface Presets', 'Appearance', 'Accent Color', 'Dashboard Widgets', 'Share & Restore'])
      label: GlobalKey(),
  };
  static final demoTabs = List.generate(4, (_) => GlobalKey());
  static final tvNav = List.generate(5, (_) => GlobalKey());
  static final demoHero = GlobalKey();
}

class TourStep {
  const TourStep({required this.title, required this.description, this.target, this.page});
  final String title;
  final String description;
  final GlobalKey? target;
  final int? page;
}

/// A full-screen non-blocking-of-app-state tutorial with an actual spotlight
/// over a target widget. Only the overlay consumes input; Skip closes all steps.
class GuidedTourOverlay extends StatefulWidget {
  const GuidedTourOverlay({
    super.key, required this.steps, required this.index, required this.onNext,
    required this.onBack, required this.onSkip, required this.brand,
  });
  final List<TourStep> steps;
  final int index;
  final VoidCallback onNext, onBack, onSkip;
  final String brand;
  @override
  State<GuidedTourOverlay> createState() => _GuidedTourOverlayState();
}

class _GuidedTourOverlayState extends State<GuidedTourOverlay> {
  Rect? _targetRect(Size bounds) {
    final targetContext = widget.steps[widget.index].target?.currentContext;
    final box = targetContext?.findRenderObject();
    final root = context.findRenderObject();
    if (box is! RenderBox || root is! RenderBox || !box.attached || !root.attached || !box.hasSize) return null;
    final offset = box.localToGlobal(Offset.zero, ancestor: root);
    final rect = (offset & box.size).inflate(5);
    if (rect.right <= 0 || rect.bottom <= 0 || rect.left >= bounds.width || rect.top >= bounds.height) return null;
    return rect.intersect(Offset.zero & bounds);
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.steps[widget.index];
    final colors = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: (context, constraints) {
      final bounds = Size(constraints.maxWidth, constraints.maxHeight);
      final target = _targetRect(bounds);
      final cardWidth = math.min(390.0, math.max(220.0, bounds.width - 32));
      // Place the tip below the actual highlighted control, or above when
      // there isn't room. On narrow screens the card scrolls if necessary.
      final preferBelow = target == null || target.center.dy < bounds.height / 2;
      final top = target == null
          ? math.max(12.0, (bounds.height - 250) / 2)
          : preferBelow
              ? math.min(bounds.height - 190, target.bottom + 26).clamp(12.0, bounds.height - 140)
              : math.max(12.0, target.top - 230);
      final left = target == null
          ? (bounds.width - cardWidth) / 2
          : (target.center.dx - cardWidth / 2).clamp(16.0, math.max(16.0, bounds.width - cardWidth - 16));
      return Stack(children: [
        Positioned.fill(child: CustomPaint(painter: _SpotlightPainter(target))),
        if (target != null)
          Positioned(
            left: (target.center.dx - 12).clamp(10.0, math.max(10.0, bounds.width - 34)),
            top: preferBelow ? (target.bottom + 2).clamp(0.0, bounds.height - 28) : (target.top - 29).clamp(0.0, bounds.height - 28),
            child: IgnorePointer(child: Icon(preferBelow ? Icons.arrow_upward : Icons.arrow_downward, color: colors.primary, size: 26)),
          ),
        Positioned(
          top: top.toDouble(), left: left.toDouble(), width: cardWidth,
          child: Material(
            elevation: 20, color: colors.surface, borderRadius: BorderRadius.circular(18),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: math.max(145.0, bounds.height - 32)),
              child: SingleChildScrollView(child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('${widget.brand} · Welcome Tour · ${widget.index + 1}/${widget.steps.length}',
                    style: TextStyle(color: colors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(step.title, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(step.description, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 14),
                  LinearProgressIndicator(value: (widget.index + 1) / widget.steps.length, minHeight: 3),
                  const SizedBox(height: 14),
                  Wrap(spacing: 8, runSpacing: 8, alignment: WrapAlignment.end, children: [
                    TextButton(key: const Key('tour-skip'), onPressed: widget.onSkip, child: const Text('Skip Tutorial')),
                    OutlinedButton(key: const Key('tour-back'), onPressed: widget.index == 0 ? null : widget.onBack, child: const Text('Back')),
                    FilledButton(key: const Key('tour-next'), onPressed: widget.onNext,
                      child: Text(widget.index == widget.steps.length - 1 ? 'Finish' : 'Next')),
                  ]),
                ]),
              )),
            ),
          ),
        ),
      ]);
    });
  }
}

class _SpotlightPainter extends CustomPainter {
  const _SpotlightPainter(this.target);
  final Rect? target;
  @override
  void paint(Canvas canvas, Size size) {
    final mask = Path()..addRect(Offset.zero & size);
    if (target != null) {
      mask.addRRect(RRect.fromRectAndRadius(target!, const Radius.circular(12)));
      mask.fillType = PathFillType.evenOdd;
    }
    canvas.drawPath(mask, Paint()..color = Colors.black.withValues(alpha: 0.77));
    if (target != null) {
      canvas.drawRRect(RRect.fromRectAndRadius(target!, const Radius.circular(12)),
        Paint()..color = const Color(0xFF7EB7FF)..style = PaintingStyle.stroke..strokeWidth = 3);
    }
  }
  @override
  bool shouldRepaint(covariant _SpotlightPainter old) => old.target != target;
}

/// Accessible, always-available starting point when the app's ordinary shell
/// is not mounted (e.g. a device-specific TV shell).
class TourHelpTile extends StatelessWidget {
  const TourHelpTile({super.key});
  @override
  Widget build(BuildContext context) => ListTile(
    key: const Key('replay-welcome-tour'),
    leading: const Icon(Icons.help_outline),
    title: const Text('Help & Tutorials'),
    subtitle: const Text('Replay the guided tour of the app and customization settings.'),
    trailing: const Icon(Icons.play_circle_outline),
    onTap: () {
      TourService.requestReplay();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Opening the guided tour…')));
    },
  );
}
