// Modified for BattleStation TV, 2026-11-22. See BSTV-NOTICE.md.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iptvmac/bstv/theme_package.dart';
import 'package:iptvmac/bstv/customization_profiles.dart';
import 'package:iptvmac/core/subscription_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The small settings (same keys as the Apple apps' UserDefaults) and the recent searches (local only, newest first).
class AppPrefs {
  SharedPreferences get updateStorage => _p;

  bool get autoPreviewSelectedChannels => _p.getBool('bstv.autoPreviewSelectedChannels') ?? false;
  set autoPreviewSelectedChannels(bool value) => _p.setBool('bstv.autoPreviewSelectedChannels', value);
  bool get keepLiveGuideOpen => _p.getBool('bstv.keepLiveGuideOpen') ?? false;
  set keepLiveGuideOpen(bool value) => _p.setBool('bstv.keepLiveGuideOpen', value);
  AppPrefs(this._p);
  final SharedPreferences _p;

  String? _profileSource;
  CustomizationProfiles? _profileCache;
  CustomizationProfiles get customizationProfiles {
    final saved=_p.getString('bstv.profiles.v1');
    if(saved!=null){if(saved==_profileSource && _profileCache!=null)return _profileCache!;try{final profiles=CustomizationProfiles.decode(saved);_profileSource=saved;_profileCache=profiles;return profiles;}catch(_){}}
    return CustomizationProfiles.initial(_legacyTheme);
  }
  BstvThemePackage get bstvTheme => customizationProfiles.active.theme;
  BstvThemePackage get _legacyTheme {
    try {
      final saved = _p.getString('bstv.appearanceTheme.v1');
      if (saved != null) return BstvThemePackage.decode(saved);
    } catch (_) { /* Corrupt stored theme safely falls back to defaults. */ }
    return BstvThemePackage(
      appearance: _p.getString('appearance') ?? 'dark',
      accentArgb: BstvThemePackage.defaultAccent,
      dashboardOrder: BstvThemePackage.defaultOrder,
      hiddenWidgets: const [],
    );
  }

  set bstvTheme(BstvThemePackage value) {
    final next=customizationProfiles.updateActive(BstvThemePackage.decode(value.encode()));
    _p.setString('bstv.profiles.v1',next.encode());
  }
  String _historyKey(String profile)=>'bstv.previousInterface.v1.$profile';
  BstvThemePackage? get previousInterface {try{final s=_p.getString(_historyKey(customizationProfiles.activeId));return s==null?null:BstvThemePackage.decode(s);}catch(_){return null;}}
  Future<void>? _interfaceWrite;
  Future<void> saveBstvTheme(BstvThemePackage value) async {
    final validated=BstvThemePackage.decode(value.encode()),profileId=customizationProfiles.activeId;
    while(_interfaceWrite!=null){try{await _interfaceWrite;}catch(_){}}
    final operation=()async{
      final previous=customizationProfiles.profiles.firstWhere((p)=>p.id==profileId).theme.encode();
      final key=_historyKey(profileId),oldHistory=_p.getString(_historyKey(profileId));
      if(!await _p.setString(key,previous))throw StateError('Could not preserve previous layout');
      try{
        final pool=customizationProfiles;
        if(!pool.profiles.any((p)=>p.id==profileId))throw StateError('Profile was removed');
        await saveCustomizationProfiles(CustomizationProfiles(activeId:pool.activeId,defaultId:pool.defaultId,profiles:[for(final profile in pool.profiles)profile.id==profileId?CustomizationProfile(id:profile.id,name:profile.name,theme:validated):profile]));
      }catch(_){if(oldHistory==null){await _p.remove(key);}else{await _p.setString(key,oldHistory);}rethrow;}
    }();
    _interfaceWrite=operation;try{await operation;}finally{if(identical(_interfaceWrite,operation))_interfaceWrite=null;}
  }
  Future<void> saveCustomizationProfiles(CustomizationProfiles value) async {
    final encoded=CustomizationProfiles.decode(value.encode()).encode();
    final previous=_p.getString('bstv.profiles.v1');
    try {
      if(!await _p.setString('bstv.profiles.v1',encoded))throw StateError('Could not save customization');
    }catch(_){
      if(previous==null){await _p.remove('bstv.profiles.v1');}else{await _p.setString('bstv.profiles.v1',previous);}
      rethrow;
    }
  }

  static const recentLimit = 8;

  String? get playlist => _p.getString('playlist'); // "all" or an account id
  set playlist(String? v) => v == null ? _p.remove('playlist') : _p.setString('playlist', v);

  /// The last subscription answers of the Xtream panels by playlist id, kept so a date shows at once and offline.
  Map<int, SubscriptionInfo> get subscriptions {
    try {
      final raw = jsonDecode(_p.getString('subscriptions') ?? '{}');
      return {
        if (raw is Map)
          for (final e in raw.entries)
            if (int.tryParse('${e.key}') case final id? when e.value is Map) id: SubscriptionInfo.fromJson((e.value as Map).cast<String, Object?>()),
      };
    } catch (_) {
      return {};
    }
  }

  set subscriptions(Map<int, SubscriptionInfo> v) => _p.setString('subscriptions', jsonEncode({for (final e in v.entries) '${e.key}': e.value.toJson()}));

  /// Asking github.com now and then whether a newer APK is out (the Mac app has the same switch).
  bool get autoCheckUpdates => _p.getBool('autoCheckUpdates') ?? true;
  set autoCheckUpdates(bool v) => _p.setBool('autoCheckUpdates', v);

  int get updateCheckedAt => _p.getInt('updateCheckedAt') ?? 0; // milliseconds since the epoch
  set updateCheckedAt(int v) => _p.setInt('updateCheckedAt', v);

  /// The newest Android version the feed named, and the one whose banner the user closed.
  String? get latestAndroid => _p.getString('latestAndroid');
  set latestAndroid(String? v) => v == null ? _p.remove('latestAndroid') : _p.setString('latestAndroid', v);
  String? get dismissedAndroid => _p.getString('dismissedAndroid');
  set dismissedAndroid(String? v) => v == null ? _p.remove('dismissedAndroid') : _p.setString('dismissedAndroid', v);

  int get refreshHours => _p.getInt('refreshHours') ?? 0; // 0 = only when the app opens
  set refreshHours(int v) => _p.setInt('refreshHours', v);

  String get hiddenWords => _p.getString('hiddenCategoryWords') ?? '';
  set hiddenWords(String v) => _p.setString('hiddenCategoryWords', v);

  bool get favoritesSortAZ => _p.getBool('favoritesSortAZ') ?? false;
  set favoritesSortAZ(bool v) => _p.setBool('favoritesSortAZ', v);

  String get appearance => bstvTheme.appearance;
  set appearance(String v) {
    _p.setString('appearance', v);
    final previous = bstvTheme;
    bstvTheme = BstvThemePackage(appearance: v, accentArgb: previous.accentArgb, dashboardOrder: previous.dashboardOrder, hiddenWidgets: previous.hiddenWidgets, layouts: previous.layouts, editor: previous.editor, interface: previous.interface);
  }

  ThemeMode get themeMode => switch (appearance) { 'light' => ThemeMode.light, 'dark' => ThemeMode.dark, _ => ThemeMode.system };

  List<String> get recents => _p.getStringList('recentSearches') ?? const [];

  void addRecent(String term) {
    final t = term.trim();
    if (t.length < 2) return;
    _p.setStringList('recentSearches', [t, ...recents.where((r) => r.toLowerCase() != t.toLowerCase())].take(recentLimit).toList());
  }

  void removeRecent(String term) => _p.setStringList('recentSearches', [for (final r in recents) if (r != term) r]);
  void clearRecents() => _p.remove('recentSearches');
}
