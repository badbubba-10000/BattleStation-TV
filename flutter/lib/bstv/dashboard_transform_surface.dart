// BattleStation TV move/resize surface. GPLv3.
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'dashboard_model.dart';
import 'dashboard_editor_model.dart';
import 'editor_preferences.dart';

class DashboardTransformSurface extends StatefulWidget {
  const DashboardTransformSurface({
    super.key,
    required this.item,
    required this.editor,
    required this.zoom,
    required this.selected,
    required this.select,
    required this.toCanvas,
    required this.menu,
  });
  final DashboardInstance item;
  final DashboardEditorModel editor;
  final double zoom;
  final bool selected;
  final VoidCallback select;
  final Offset Function(Offset) toCanvas;
  final Widget menu;
  @override
  State<DashboardTransformSurface> createState() =>
      _DashboardTransformSurfaceState();
}

class _DashboardTransformSurfaceState extends State<DashboardTransformSurface> {
  bool hovered = false;
  Offset? start;
  Rect? original;
  int? pointer;
  String? edge;
  void down(PointerDownEvent event, String handle) {
    if (pointer != null ||
        event.buttons != kPrimaryButton ||
        widget.item.locked) {
      return;
    }
    pointer = event.pointer;
    edge = handle;
    start = widget.toCanvas(event.position);
    final item = widget.item;
    original = Rect.fromLTWH(item.x, item.y, item.width, item.height);
    widget.select();
    widget.editor.beginTransform();
  }

  void move(PointerMoveEvent event) {
    if (event.pointer != pointer) return;
    final delta = widget.toCanvas(event.position) - start!,
        r = original!,
        handle = edge!;
    final next = handle == 'move'
        ? r.shift(delta)
        : Rect.fromLTRB(
            r.left + (handle.contains('left') ? delta.dx : 0),
            r.top + (handle.contains('top') ? delta.dy : 0),
            r.right + (handle.contains('right') ? delta.dx : 0),
            r.bottom + (handle.contains('bottom') ? delta.dy : 0),
          );
    widget.editor.transform(
      widget.item.id,
      next,
      handle,
      bypassSnap: HardwareKeyboard.instance.isAltPressed,
    );
  }

  void end(PointerEvent event, {bool cancel = false}) {
    if (event.pointer != pointer) return;
    pointer = null;
    widget.editor.endTransform(cancel: cancel);
  }

  Widget zone(String handle, MouseCursor cursor, Widget child) => MouseRegion(
    cursor: widget.item.locked ? SystemMouseCursors.forbidden : cursor,
    child: RawGestureDetector(
      behavior: HitTestBehavior.opaque,
      gestures: {
        EagerGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<EagerGestureRecognizer>(
              () => EagerGestureRecognizer(),
              (_) {},
            ),
      },
      child: Listener(
        key: Key('transform-${widget.item.id}-$handle'),
        behavior: HitTestBehavior.opaque,
        onPointerDown: (e) => down(e, handle),
        onPointerMove: move,
        onPointerUp: end,
        onPointerCancel: (e) => end(e, cancel: true),
        child: child,
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final touch =
        Theme.of(context).platform == TargetPlatform.android ||
        Theme.of(context).platform == TargetPlatform.iOS;
    final active = hovered || widget.selected;
    // Hit zones stay at least 10 screen pixels even at 50% zoom; touch gets 24.
    final edgeSize = (touch ? 24.0 : 10.0) / widget.zoom;
    final cornerSize = max(edgeSize * 1.5, 16 / widget.zoom);
    Widget mark() => IgnorePointer(
      child: Center(
        child: Container(
          width: 7 / widget.zoom,
          height: 7 / widget.zoom,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.all(color: color, width: 1 / widget.zoom),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: Stack(
        fit: StackFit.expand,
        children: [
          zone('move', SystemMouseCursors.move, const SizedBox.expand()),
          IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: active
                    ? Border.all(
                        color: color.withValues(
                          alpha: widget.selected ? .8 : .4,
                        ),
                        width: 1.5 / widget.zoom,
                      )
                    : null,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            top: edgeSize,
            right: edgeSize,
            // The real dashboard panel owns its heading. Editing adds controls only.
            child: widget.menu,
          ),
          Positioned(
            left: 0,
            top: cornerSize,
            bottom: cornerSize,
            width: edgeSize,
            child: zone(
              'left',
              SystemMouseCursors.resizeLeftRight,
              active ? mark() : const SizedBox.expand(),
            ),
          ),
          Positioned(
            right: 0,
            top: cornerSize,
            bottom: cornerSize,
            width: edgeSize,
            child: zone(
              'right',
              SystemMouseCursors.resizeLeftRight,
              active ? mark() : const SizedBox.expand(),
            ),
          ),
          Positioned(
            top: 0,
            left: cornerSize,
            right: cornerSize,
            height: edgeSize,
            child: zone(
              'top',
              SystemMouseCursors.resizeUpDown,
              active ? mark() : const SizedBox.expand(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: cornerSize,
            right: cornerSize,
            height: edgeSize,
            child: zone(
              'bottom',
              SystemMouseCursors.resizeUpDown,
              active ? mark() : const SizedBox.expand(),
            ),
          ),
          for (final handle in [
            'top-left',
            'top-right',
            'bottom-left',
            'bottom-right',
          ])
            Positioned(
              left: handle.contains('left') ? 0 : null,
              right: handle.contains('right') ? 0 : null,
              top: handle.contains('top') ? 0 : null,
              bottom: handle.contains('bottom') ? 0 : null,
              width: cornerSize,
              height: cornerSize,
              child: zone(
                handle,
                handle == 'top-left' || handle == 'bottom-right'
                    ? SystemMouseCursors.resizeUpLeftDownRight
                    : SystemMouseCursors.resizeUpRightDownLeft,
                active || touch ? mark() : const SizedBox.expand(),
              ),
            ),
        ],
      ),
    );
  }
}

class EditorGridPainter extends CustomPainter {
  EditorGridPainter(this.editor, this.color, {this.grid = true})
    : preferences = editor.preferences;
  final EditorPreferences preferences;
  final bool grid;
  final DashboardEditorModel editor;
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    final prefs = editor.preferences;
    if (grid && prefs.showGrid) {
      final paint = Paint()
        ..color = color.withValues(alpha: prefs.gridOpacity)
        ..strokeWidth = .5;
      for (double x = 0; x < size.width; x += prefs.gridSize) {
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
      }
      for (double y = 0; y < size.height; y += prefs.gridSize) {
        canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      }
    }
    if (!grid && prefs.showGuides) {
      final guide = Paint()
        ..color = color.withValues(alpha: .7)
        ..strokeWidth = 1;
      for (final x in editor.verticalGuides) {
        canvas.drawLine(Offset(x, 0), Offset(x, size.height), guide);
      }
      for (final y in editor.horizontalGuides) {
        canvas.drawLine(Offset(0, y), Offset(size.width, y), guide);
      }
    }
    if (!grid && editor.candidate != null) {
      final rect = editor.candidate!;
      canvas.drawRect(
        rect,
        (Paint()..color = editor.collision ? Colors.red : color)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant EditorGridPainter oldDelegate) =>
      !grid ||
      oldDelegate.color != color ||
      oldDelegate.preferences.showGrid != preferences.showGrid ||
      oldDelegate.preferences.gridSize != preferences.gridSize ||
      oldDelegate.preferences.gridOpacity != preferences.gridOpacity;
}
