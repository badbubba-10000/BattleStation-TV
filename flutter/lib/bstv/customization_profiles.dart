// BattleStation TV local customization profiles. GPLv3.
import 'dart:convert';

import 'theme_package.dart';

class CustomizationProfile {
  const CustomizationProfile({
    required this.id,
    required this.name,
    required this.theme,
  });
  final String id, name;
  final BstvThemePackage theme;
  Map<String, Object> toJson() => {
    'id': id,
    'name': name,
    'theme': theme.toJson(),
  };
}

class CustomizationProfiles {
  CustomizationProfiles({
    required this.activeId,
    required this.defaultId,
    required List<CustomizationProfile> profiles,
  }) : profiles = List.unmodifiable(profiles) {
    if (profiles.isEmpty ||
        profiles.length > 12 ||
        profiles.map((p) => p.id).toSet().length != profiles.length ||
        !profiles.any((p) => p.id == activeId) ||
        !profiles.any((p) => p.id == defaultId)) {
      throw const FormatException('Invalid profile collection');
    }
    for (final p in profiles) {
      if (!RegExp(r'^[a-zA-Z0-9_-]{1,80}$').hasMatch(p.id) ||
          p.name.trim().isEmpty ||
          p.name.length > 60 ||
          RegExp(r'[\x00-\x1f]').hasMatch(p.name)) {
        throw const FormatException('Invalid profile name');
      }
    }
  }
  final String activeId, defaultId;
  final List<CustomizationProfile> profiles;
  CustomizationProfile get active =>
      profiles.firstWhere((p) => p.id == activeId);
  factory CustomizationProfiles.initial(BstvThemePackage theme) =>
      CustomizationProfiles(
        activeId: 'default',
        defaultId: 'default',
        profiles: [
          CustomizationProfile(id: 'default', name: 'Default', theme: theme),
        ],
      );
  CustomizationProfiles activate(String id) => CustomizationProfiles(
    activeId: id,
    defaultId: defaultId,
    profiles: profiles,
  );
  CustomizationProfiles setDefault(String id) => CustomizationProfiles(
    activeId: activeId,
    defaultId: id,
    profiles: profiles,
  );
  CustomizationProfiles updateActive(BstvThemePackage theme) =>
      CustomizationProfiles(
        activeId: activeId,
        defaultId: defaultId,
        profiles: [
          for (final p in profiles)
            p.id == activeId
                ? CustomizationProfile(id: p.id, name: p.name, theme: theme)
                : p,
        ],
      );
  CustomizationProfiles rename(String id, String name) => CustomizationProfiles(
    activeId: activeId,
    defaultId: defaultId,
    profiles: [
      for (final p in profiles)
        p.id == id
            ? CustomizationProfile(id: p.id, name: name.trim(), theme: p.theme)
            : p,
    ],
  );
  CustomizationProfiles add(String name, {BstvThemePackage? theme}) {
    final id = 'profile-${DateTime.now().microsecondsSinceEpoch}';
    return CustomizationProfiles(
      activeId: activeId,
      defaultId: defaultId,
      profiles: [
        ...profiles,
        CustomizationProfile(
          id: id,
          name: name.trim(),
          theme: theme ?? active.theme,
        ),
      ],
    );
  }

  CustomizationProfiles remove(String id) {
    if (id == defaultId || profiles.length == 1) {
      throw const FormatException('Keep the default profile for recovery');
    }
    return CustomizationProfiles(
      activeId: activeId == id ? defaultId : activeId,
      defaultId: defaultId,
      profiles: profiles.where((p) => p.id != id).toList(),
    );
  }

  String encode() => jsonEncode({
    'version': 1,
    'active': activeId,
    'default': defaultId,
    'profiles': [for (final p in profiles) p.toJson()],
  });
  static CustomizationProfiles decode(String source) {
    if (utf8.encode(source).length > 4 * 1024 * 1024) {
      throw const FormatException('Profile collection too large');
    }
    try {
      final json = jsonDecode(source) as Map<String, dynamic>;
      if (json.keys.any(
            (k) => !{'version', 'active', 'default', 'profiles'}.contains(k),
          ) ||
          json['version'] != 1 ||
          json['profiles'] is! List ||
          (json['profiles'] as List).length > 12) {
        throw const FormatException('Unsupported profiles');
      }
      return CustomizationProfiles(
        activeId: json['active'],
        defaultId: json['default'],
        profiles: [for (final p in json['profiles']) parseProfile(p)],
      );
    } catch (_) {
      throw const FormatException('Invalid customization profiles');
    }
  }

  static CustomizationProfile parseProfile(dynamic p) {
    if (p is! Map || p.keys.any((k) => !{'id', 'name', 'theme'}.contains(k))) {
      throw const FormatException('Invalid profile');
    }
    return CustomizationProfile(
      id: p['id'],
      name: p['name'],
      theme: BstvThemePackage.decode(jsonEncode(p['theme'])),
    );
  }
}
