// BattleStation TV profile management. GPLv3.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iptvmac/app/library_model.dart';

import 'theme_package.dart';
import 'dashboard_editor.dart';
import 'dashboard_model.dart';

class CustomizationProfilesScreen extends StatelessWidget {
  const CustomizationProfilesScreen({super.key});
  Future<String?> _name(BuildContext context, String initial) async {
    String value = initial;
    return showDialog<String>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Profile name'),
        content: TextFormField(
          initialValue: initial,
          maxLength: 60,
          autofocus: true,
          onChanged: (text) => value = text,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (value.trim().isNotEmpty) Navigator.pop(dialog, value.trim());
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _run(
    BuildContext context,
    Future<void> Function() action,
  ) async {
    try {
      await action();
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Could not apply profile. The previous customization was preserved.',
            ),
          ),
        );
      }
    }
  }

  Future<void> _add(
    BuildContext context,
    LibraryModel model, {
    BstvThemePackage? theme,
    String initial = 'New profile',
  }) async {
    final name = await _name(context, initial);
    if (name == null || !context.mounted) return;
    await _run(
      context,
      () => model.applyCustomizationProfiles(
        model.prefs.customizationProfiles.add(name, theme: theme),
      ),
    );
  }

  Future<void> _import(BuildContext context, LibraryModel model) async {
    await _run(context, () async {
      final file = await FilePicker.pickFile(type: FileType.any);
      if (file == null) return;
      final length = await file.length();
      if (length == null || length > BstvThemePackage.maxBytes) {
        throw const FormatException('Theme too large');
      }
      final theme = BstvThemePackage.decode(
        utf8.decode(await file.readAsBytes()),
      );
      if (!context.mounted) return;
      final accepted = await showDialog<bool>(
        context: context,
        builder: (dialog) => AlertDialog(
          title: const Text('Import as a new profile?'),
          content: Text(
            '${theme.appearance} appearance • ${theme.layouts.length} device layouts\nYour active profile will remain unchanged.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialog, true),
              child: const Text('Continue'),
            ),
          ],
        ),
      );
      if (accepted == true && context.mounted) {
        await _add(context, model, theme: theme, initial: 'Imported profile');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LibraryModel>(),
        profiles = model.prefs.customizationProfiles;
    return Scaffold(
      appBar: AppBar(title: const Text('Customization Profiles')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Wrap(
            spacing: 8,
            children: [
              FilledButton(
                onPressed: profiles.profiles.length < 12
                    ? () => _add(
                        context,
                        model,
                        theme: BstvThemePackage.defaults(),
                      )
                    : null,
                child: const Text('Create profile'),
              ),
              OutlinedButton(
                onPressed: profiles.profiles.length < 12
                    ? () => _import(context, model)
                    : null,
                child: const Text('Import profile'),
              ),
              TextButton(
                onPressed: () => _run(
                  context,
                  () => model.applyCustomizationProfiles(
                    profiles.activate(profiles.defaultId),
                  ),
                ),
                child: const Text('Restore default profile'),
              ),
            ],
          ),
          const Text(
            'Profiles contain appearance and layouts only. Playlists and credentials are shared and are never exported. Up to 12 profiles.',
          ),
          for (final profile in profiles.profiles)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${profile.name}${profile.id == profiles.activeId ? ' • Active' : ''}${profile.id == profiles.defaultId ? ' • Default' : ''}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Wrap(
                      spacing: 8,
                      children: [
                        TextButton(
                          onPressed: profile.id == profiles.activeId
                              ? null
                              : () => _run(
                                  context,
                                  () => model.applyCustomizationProfiles(
                                    profiles.activate(profile.id),
                                  ),
                                ),
                          child: const Text('Activate'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final name = await _name(context, profile.name);
                            if (name != null && context.mounted) {
                              await _run(
                                context,
                                () => model.applyCustomizationProfiles(
                                  model.prefs.customizationProfiles.rename(
                                    profile.id,
                                    name,
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text('Rename'),
                        ),
                        TextButton(
                          onPressed: profiles.profiles.length < 12
                              ? () => _add(
                                  context,
                                  model,
                                  theme: profile.theme,
                                  initial: '${profile.name} copy',
                                )
                              : null,
                          child: const Text('Duplicate'),
                        ),
                        TextButton(
                          onPressed: () => _run(context, () async {
                            await model.applyCustomizationProfiles(
                              profiles.activate(profile.id),
                            );
                            if (context.mounted) {
                              await Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (_) => DashboardEditor(
                                    initialDevice: dashboardDevice(
                                      MediaQuery.sizeOf(context).width,
                                    ),
                                  ),
                                ),
                              );
                            }
                          }),
                          child: const Text('Edit dashboard'),
                        ),
                        TextButton(
                          onPressed: profile.id == profiles.defaultId
                              ? null
                              : () => _run(
                                  context,
                                  () => model.applyCustomizationProfiles(
                                    profiles.setDefault(profile.id),
                                  ),
                                ),
                          child: const Text('Set default'),
                        ),
                        TextButton(
                          onPressed: () => _run(context, () async {
                            await FilePicker.saveFile(
                              dialogTitle: 'Export profile',
                              fileName: 'Custom-Profile.bstvtheme',
                              type: FileType.custom,
                              allowedExtensions: ['bstvtheme'],
                              mimeType: 'application/json',
                              bytes: utf8.encode(profile.theme.encode()),
                            );
                          }),
                          child: const Text('Export'),
                        ),
                        TextButton(
                          onPressed: profile.id == profiles.defaultId
                              ? null
                              : () async {
                                  final accepted = await showDialog<bool>(
                                    context: context,
                                    builder: (dialog) => AlertDialog(
                                      title: Text('Delete ${profile.name}?'),
                                      content: const Text(
                                        'Only this customization profile will be removed.',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(dialog, false),
                                          child: const Text('Cancel'),
                                        ),
                                        FilledButton(
                                          onPressed: () =>
                                              Navigator.pop(dialog, true),
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );
                                  if (accepted == true && context.mounted) {
                                    await _run(
                                      context,
                                      () => model.applyCustomizationProfiles(
                                        model.prefs.customizationProfiles
                                            .remove(profile.id),
                                      ),
                                    );
                                  }
                                },
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
