// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'package:iptvmac/core/models.dart';

import 'feature_models.dart';

enum EpgAvailability {
  all,
  hasEpg,
  noEpg;

  static EpgAvailability restore(Object? value) =>
      values.where((v) => v.name == value).firstOrNull ?? all;
}

class GuideFilterResult {
  const GuideFilterResult(this.channels, this.total, this.hasEpg);
  final List<Item> channels;
  final int total, hasEpg;
  int get noEpg => total - hasEpg;
}

/// Counts follow favorites/category selection, before availability/search filters.
GuideFilterResult filterGuideChannels(
  List<Item> channels, {
  required Set<String> available,
  required Set<String> searchMatches,
  EpgAvailability availability = EpgAvailability.all,
  bool favoritesOnly = false,
  Set<String> favorites = const {},
  String category = '',
  bool hideEmpty = false,
  bool searching = false,
}) {
  final base = channels
      .where(
        (c) =>
            (!favoritesOnly || favorites.contains(channelKey(c))) &&
            (category.isEmpty || c.categoryId == category),
      )
      .toList();
  final has = base.where((c) => available.contains(channelKey(c))).length;
  final visible = base.where((c) {
    final key = channelKey(c), present = available.contains(key);
    if (availability == EpgAvailability.hasEpg && !present) return false;
    if (availability == EpgAvailability.noEpg && present) return false;
    if (hideEmpty && availability != EpgAvailability.noEpg && !present) {
      return false;
    }
    return !searching || searchMatches.contains(key);
  }).toList();
  return GuideFilterResult(visible, base.length, has);
}
