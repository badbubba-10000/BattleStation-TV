// BattleStation TV visual layout editing. GPLv3.
import 'dart:math';
import 'dart:ui';

import 'editor_preferences.dart';

import 'package:flutter/foundation.dart';

import 'dashboard_model.dart';

bool overlaps(DashboardInstance a, DashboardInstance b) =>
    a.x < b.x + b.width &&
    a.x + a.width > b.x &&
    a.y < b.y + b.height &&
    a.y + a.height > b.y;

/// Deterministic collision packing preserves instances/configuration while moving
/// colliding widgets downward. Hidden widgets do not consume visible space.
DashboardLayout packDashboard(DashboardLayout layout, {String? priority}) {
  final placed = <DashboardInstance>[];
  final ordered = [
    if (priority != null) ...layout.widgets.where((w) => w.id == priority),
    ...layout.widgets.where((w) => w.id != priority),
  ];
  for (final original in ordered.where((w) => w.visible)) {
    final definition = DashboardRegistry.definitions[original.kind]!;
    final width = original.width.clamp(definition.minWidth, layout.canvasWidth);
    final height = original.height.clamp(
      definition.minHeight,
      definition.maxHeight,
    );
    var item = original.copyWith(
      width: width,
      height: height,
      x: original.x.clamp(0.0, layout.canvasWidth - width),
    );
    while (placed.any((other) => overlaps(item, other))) {
      final bottom = placed
          .where((other) => overlaps(item, other))
          .map((w) => w.y + w.height)
          .reduce(max);
      item = item.copyWith(y: bottom);
    }
    placed.add(item);
  }
  final byId = {for (final item in placed) item.id: item};
  return DashboardLayout(
    device: layout.device,
    widgets: [for (final item in layout.widgets) byId[item.id] ?? item],
  );
}

DashboardLayout arrangeDashboard(DashboardLayout layout) {
  var x = 0.0, y = 0.0, rowHeight = 0.0;
  final arranged = <DashboardInstance>[];
  for (final item in layout.widgets) {
    if (!item.visible) {
      arranged.add(item);
      continue;
    }
    final width = min(item.width, layout.canvasWidth);
    if (x + width > layout.canvasWidth) {
      x = 0;
      y += rowHeight;
      rowHeight = 0;
    }
    arranged.add(item.copyWith(x: x, y: y, width: width));
    x += width;
    rowHeight = max(rowHeight, item.height);
  }
  return packDashboard(
    DashboardLayout(device: layout.device, widgets: arranged),
  );
}

class DashboardEditorModel extends ChangeNotifier {
  DashboardEditorModel(
    DashboardLayout initial, {
    this.preferences = const EditorPreferences(),
  }) : saved = initial,
       draft = initial;
  EditorPreferences preferences;
  DashboardLayout? _gestureStart;
  Rect? candidate;
  bool collision = false;
  List<double> verticalGuides = [], horizontalGuides = [];
  final DashboardLayout saved;
  DashboardLayout draft;
  final _undo = <DashboardLayout>[], _redo = <DashboardLayout>[];
  bool get canUndo => _undo.isNotEmpty;
  bool get canRedo => _redo.isNotEmpty;
  bool get dirty => draft.toJson().toString() != saved.toJson().toString();
  void _change(DashboardLayout next) {
    if (next.toJson().toString() == draft.toJson().toString()) return;
    _undo.add(draft);
    if (_undo.length > 100) _undo.removeAt(0);
    _redo.clear();
    draft = next;
    notifyListeners();
  }

  void update(DashboardInstance next) => _change(
    packDashboard(
      DashboardLayout(
        device: draft.device,
        widgets: [
          for (final item in draft.widgets) item.id == next.id ? next : item,
        ],
      ),
      priority: next.id,
    ),
  );
  void beginTransform() {
    _gestureStart = draft;
    candidate = null;
    collision = false;
  }

  void endTransform({bool cancel = false}) {
    final start = _gestureStart;
    final wasColliding = collision;
    _gestureStart = null;
    candidate = null;
    collision = false;
    verticalGuides = [];
    horizontalGuides = [];
    if (start != null) {
      // Never commit a gesture whose final target is occupied. The preview
      // outline can enter other widgets, but their saved positions stay put.
      if (cancel || wasColliding) {
        draft = start;
      } else if (start.toJson().toString() != draft.toJson().toString()) {
        _undo.add(start);
        if (_undo.length > 100) _undo.removeAt(0);
        _redo.clear();
      }
    }
    notifyListeners();
  }

  void transform(
    String id,
    Rect proposed,
    String edge, {
    bool bypassSnap = false,
  }) {
    final item = draft.widgets.firstWhere((w) => w.id == id);
    if (item.locked) return;
    final definition = DashboardRegistry.definitions[item.kind]!;
    final moving = edge == 'move';
    final leftEdge = edge.contains('left'),
        rightEdge = edge.contains('right'),
        topEdge = edge.contains('top'),
        bottomEdge = edge.contains('bottom');
    var left = proposed.left,
        top = proposed.top,
        right = proposed.right,
        bottom = proposed.bottom;
    double snap(double v) => !bypassSnap && preferences.snap
        ? (v / preferences.gridSize).round() * preferences.gridSize
        : v;
    if (moving) {
      left = snap(left);
      top = snap(top);
      right = left + item.width;
      bottom = top + item.height;
    } else {
      if (leftEdge) left = snap(left);
      if (rightEdge) right = snap(right);
      if (topEdge) top = snap(top);
      if (bottomEdge) bottom = snap(bottom);
    }
    verticalGuides = [];
    horizontalGuides = [];
    if (preferences.magnetic && !bypassSnap) {
      final others = draft.widgets.where((w) => w.visible && w.id != id);
      double? align(List<double> own, Iterable<double> targets) {
        double? delta;
        for (final a in own) {
          for (final target in targets) {
            final d = target - a;
            if (d.abs() <= preferences.threshold &&
                (delta == null || d.abs() < delta.abs())) {
              delta = d;
            }
          }
        }
        return delta;
      }

      final xs = [
        for (final other in others) ...[
          other.x,
          other.x + other.width,
          other.x + other.width / 2,
        ],
      ];
      final ys = [
        for (final other in others) ...[
          other.y,
          other.y + other.height,
          other.y + other.height / 2,
        ],
      ];
      final dx = align(
        moving
            ? [left, right, (left + right) / 2]
            : [if (leftEdge) left, if (rightEdge) right],
        xs,
      );
      final dy = align(
        moving
            ? [top, bottom, (top + bottom) / 2]
            : [if (topEdge) top, if (bottomEdge) bottom],
        ys,
      );
      if (dx != null) {
        if (moving || leftEdge) left += dx;
        if (moving || rightEdge) right += dx;
        verticalGuides = xs
            .where(
              (x) => [
                left,
                right,
                (left + right) / 2,
              ].any((a) => (x - a).abs() < .001),
            )
            .toList();
      }
      if (dy != null) {
        if (moving || topEdge) top += dy;
        if (moving || bottomEdge) bottom += dy;
        horizontalGuides = ys
            .where(
              (y) => [
                top,
                bottom,
                (top + bottom) / 2,
              ].any((a) => (y - a).abs() < .001),
            )
            .toList();
      }
    }
    if (moving) {
      left = left.clamp(0.0, draft.canvasWidth - item.width);
      top = top.clamp(0.0, 120000.0 - item.height);
      right = left + item.width;
      bottom = top + item.height;
    } else {
      if (leftEdge) {
        left = left.clamp(
          max(0.0, right - definition.maxWidth),
          right - definition.minWidth,
        );
      }
      if (rightEdge) {
        right = right.clamp(
          left + definition.minWidth,
          min(draft.canvasWidth, left + definition.maxWidth),
        );
      }
      if (topEdge) {
        top = top.clamp(
          max(0.0, bottom - definition.maxHeight),
          bottom - definition.minHeight,
        );
      }
      if (bottomEdge) {
        bottom = bottom.clamp(
          top + definition.minHeight,
          min(120000.0, top + definition.maxHeight),
        );
      }
    }
    candidate = Rect.fromLTRB(left, top, right, bottom);
    final next = item.copyWith(
      x: left,
      y: top,
      width: right - left,
      height: bottom - top,
    );
    final base = _gestureStart ?? draft;
    collision = base.widgets.any(
      (w) => w.id != id && w.visible && overlaps(next, w),
    );
    // Never re-pack the other widgets on every pointer movement. Re-packing
    // was pushing unrelated tiles down as the pointer crossed them, making
    // dragging jumpy and destroying the intended placement. An occupied target
    // is shown by the red candidate outline while the last valid layout stays
    // intact; it cannot be committed on pointer-up.
    if (!collision) {
      draft = DashboardLayout(
        device: base.device,
        widgets: [for (final w in base.widgets) w.id == id ? next : w],
      );
    }
    notifyListeners();
  }

  void move(String id, double x, double y) {
    final item = draft.widgets.firstWhere((w) => w.id == id);
    beginTransform();
    transform(id, Rect.fromLTWH(x, y, item.width, item.height), 'move');
    endTransform();
  }

  void resize(String id, double width, double height) {
    final item = draft.widgets.firstWhere((w) => w.id == id);
    beginTransform();
    transform(id, Rect.fromLTWH(item.x, item.y, width, height), 'bottom-right');
    endTransform();
  }

  void add(DashboardKind kind) {
    if (draft.widgets.length >= 64) {
      throw const FormatException('A layout supports at most 64 widgets');
    }
    final id =
        '${kind.name}-${DateTime.now().microsecondsSinceEpoch}-${Random.secure().nextInt(100000)}';
    final item = DashboardInstance(
      id: id,
      kind: kind,
      width: kind == DashboardKind.featured ? draft.canvasWidth : 400,
    );
    _change(
      packDashboard(
        DashboardLayout(
          device: draft.device,
          widgets: [...draft.widgets, item],
        ),
      ),
    );
  }

  void duplicate(String id) {
    if (draft.widgets.length >= 64) {
      throw const FormatException('A layout supports at most 64 widgets');
    }
    final item = draft.widgets.firstWhere((w) => w.id == id);
    final copy = item.copyWith(
      id: 'copy-${DateTime.now().microsecondsSinceEpoch}-${Random.secure().nextInt(100000)}',
      y: item.y + 60,
    );
    _change(
      packDashboard(
        DashboardLayout(
          device: draft.device,
          widgets: [...draft.widgets, copy],
        ),
      ),
    );
  }

  void remove(String id) => _change(
    DashboardLayout(
      device: draft.device,
      widgets: draft.widgets.where((w) => w.id != id).toList(),
    ),
  );
  void arrange() => _change(arrangeDashboard(draft));
  void reset() =>
      _change(arrangeDashboard(DashboardLayout.defaults(draft.device)));
  void undo() {
    if (!canUndo) return;
    _redo.add(draft);
    draft = _undo.removeLast();
    notifyListeners();
  }

  void redo() {
    if (!canRedo) return;
    _undo.add(draft);
    draft = _redo.removeLast();
    notifyListeners();
  }

  void cancel() {
    draft = saved;
    _undo.clear();
    _redo.clear();
    notifyListeners();
  }
}
