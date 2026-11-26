import 'package:iptvmac/bstv/local_data_policy.dart';
// Optional account & theme-only cloud backup for both independent editions.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/bstv/cloud_sync_service.dart';
import 'package:provider/provider.dart';

class CloudSyncScreen extends StatefulWidget {
  const CloudSyncScreen({super.key, this.client});
  final CloudSyncClient? client;
  @override
  State<CloudSyncScreen> createState() => _CloudSyncScreenState();
}

class _CloudSyncScreenState extends State<CloudSyncScreen> {
  late final client = widget.client ?? CloudSyncClient();
  final email = TextEditingController(), password = TextEditingController();
  bool busy = true, register = false;
  String? status;
  @override
  void initState() {
    super.initState();
    if (!localDataOnly) {
      _resume();
    } else {
      busy = false;
    }
  }


  List<CloudBackup> backups = [];
  bool backupsLoaded = false;
  Map<String, dynamic>? accountInfo;

  Future<void> _refreshBackups() async {
    final values = await client.listBackups();
    if (mounted) setState(() { backups = values; backupsLoaded = true; });
  }

  Future<String?> _askName([String initial = '']) async {
    var name = initial;
    return showDialog<String>(context: context, builder: (c) => AlertDialog(
      title: const Text('Backup name'),
      content: TextFormField(initialValue: initial, autofocus: true, maxLength: 60,
        decoration: const InputDecoration(labelText: 'Name (no private information)'),
        onChanged: (value) => name = value),
      actions: [TextButton(onPressed: () => Navigator.pop(c), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.pop(c, name), child: const Text('Save'))],
    ));
  }

  Future<void> _createBackup(LibraryModel model) async {
    await _refreshBackups();
    final used = backups.map((b) => b.slot).toSet();
    if (used.length >= 5) throw const CloudSyncException('All five slots are occupied. Delete a backup first.');
    if (!mounted) return;
    final name = await _askName('Backup ${DateTime.now().toLocal().toString().substring(0, 16).replaceAll(":", "-")}');
    if (name == null || !mounted) return;
    await client.createBackup(List.generate(5, (i) => i + 1).firstWhere((i) => !used.contains(i)), name, model.prefs.bstvTheme);
    await _refreshBackups();
  }

  Future<void> _viewData() async {
    final data = await client.exportCloudData();
    if (!mounted) return;
    await showDialog<void>(context: context, builder: (c) => AlertDialog(
      title: const Text('My cloud data'),
      content: SizedBox(width: 600, child: SingleChildScrollView(child: SelectableText(data))),
      actions: [TextButton(onPressed: () async { await Clipboard.setData(ClipboardData(text: data)); if (c.mounted) Navigator.pop(c); }, child: const Text('Copy JSON export')),
        TextButton(onPressed: () => Navigator.pop(c), child: const Text('Close'))],
    ));
  }

  List<Widget> _backupControls(LibraryModel model) => [
    const Divider(),
    Text('My Cloud Backups', style: Theme.of(context).textTheme.titleLarge),
    Text(backupsLoaded ? '${backups.length} / 5 backup slots used' : 'Refresh to view your five backup slots.'),
    OutlinedButton.icon(onPressed: busy ? null : () => run(_refreshBackups), icon: const Icon(Icons.refresh), label: const Text('Refresh backup list')),
    FilledButton.icon(onPressed: busy ? null : () => run(() => _createBackup(model)), icon: const Icon(Icons.add), label: const Text('Create named backup')),
    for (final b in backups) Card(child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(b.name, style: Theme.of(context).textTheme.titleMedium),
      Text('Slot ${b.slot} • ${b.bytes} theme bytes'),
      Text('Created: ${DateTime.tryParse(b.createdAt)?.toLocal() ?? b.createdAt}'),
      Text('Updated: ${DateTime.tryParse(b.updatedAt)?.toLocal() ?? b.updatedAt}'),
      Wrap(spacing: 8, children: [
        TextButton(onPressed: busy ? null : () => run(() async {
          if (await _confirm('Restore backup?', 'Replace the current appearance with this saved backup? Local IPTV data is unchanged.', 'Restore')) await model.applyBstvTheme(b.theme);
        }), child: const Text('Restore')),
        TextButton(onPressed: busy ? null : () => run(() async {
          final name = await _askName(b.name); if (name == null) return;
          await client.renameBackup(b, name); await _refreshBackups();
        }), child: const Text('Rename')),
        TextButton(onPressed: busy ? null : () => run(() async {
          if (await _confirm('Delete backup?', 'Permanently remove this cloud backup?', 'Delete')) { await client.deleteBackup(b); await _refreshBackups(); }
        }), child: const Text('Delete')),
      ]),
    ]))),
    const Divider(),
    Text('Manage My Data', style: Theme.of(context).textTheme.titleLarge),
    if (accountInfo != null) Text(accountInfo!['emailVerified'] == true ? 'Email verified' : 'Email not verified'),
    OutlinedButton.icon(onPressed: busy ? null : () => run(() async {
      final info = await client.refreshAccountInfo(); await _refreshBackups();
      if (mounted) setState(() => accountInfo = info);
    }), icon: const Icon(Icons.refresh), label: const Text('Refresh account and backup data')),
    OutlinedButton.icon(onPressed: busy ? null : () => run(_viewData), icon: const Icon(Icons.visibility), label: const Text('View / export my cloud data')),
    OutlinedButton.icon(onPressed: busy ? null : () => run(() async {
      final address = client.email;
      if (address == null) throw const CloudSyncException('Sign in again first.');
      await client.sendPasswordReset(address);
    }, success: 'Password reset email requested.'), icon: const Icon(Icons.key), label: const Text('Change password by email')),
    OutlinedButton.icon(onPressed: busy ? null : () => run(() async {
      if (await _confirm('Delete all cloud data for this app?', 'Deletes the current cloud theme and all five backup slots. Local data and your login are kept.', 'Delete all')) {
        await client.deleteEditionData(CloudSyncConfig.appId); await _refreshBackups();
      }
    }), icon: const Icon(Icons.delete_outline), label: const Text('Delete all cloud data for this app')),
  ];

  Future<void> _resume() async {
    try {
      await client.restoreSession();
      if (client.signedIn) await _refreshBackups();
    } catch (_) {
      /* sign in again if needed */
    }
    if (mounted) setState(() => busy = false);
  }

  Future<void> run(
    Future<void> Function() action, {
    String success = 'Completed.',
  }) async {
    if (busy) return;
    setState(() {
      busy = true;
      status = null;
    });
    try {
      await action();
      if (mounted) setState(() => status = success);
    } on CloudSyncException catch (e) {
      if (mounted) setState(() => status = e.message);
    } catch (_) {
      if (mounted) {
        setState(() => status = 'Operation failed. Please try again.');
      }
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<bool> _confirm(String title, String message, String button) async =>
      await showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(c, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(c, true),
              child: Text(button),
            ),
          ],
        ),
      ) ??
      false;
  // This dialog is required before creating a cloud account. Nothing is sent
  // to Firebase unless the user actively accepts the disclosure.
  Future<bool> _confirmAccountDataDisclosure() async {
    var acknowledged = false;
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) => StatefulBuilder(
            builder: (dialogContext, setDialogState) => AlertDialog(
              title: const Row(
                children: [
                  Icon(Icons.privacy_tip_outlined),
                  SizedBox(width: 10),
                  Expanded(child: Text('Before you create a cloud account')),
                ],
              ),
              content: SizedBox(
                width: 520,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Creating an optional account uses Google Firebase, an external cloud provider. '
                        'The following information is sent or saved when you register:',
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Account creation and sign-in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '• Your email address and password are sent securely to Firebase Authentication. '
                        'Firebase manages your login credentials; the app does not save your plaintext password in Firestore.\n'
                        '• Firebase assigns an account ID and issues sign-in tokens. '
                        'The app saves session credentials securely on this device to keep you signed in.\n'
                        '• Google may process connection details, such as your IP address and service logs, to operate and protect Firebase.',
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Only if you choose Save to Cloud later',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '• Your current theme, accent colors, interface preferences, '
                        'and dashboard widget layout are stored in your private Firestore settings document.\n'
                        '• Cloud backup is manual, supports five named appearance backups per edition, and is not end-to-end encrypted.',
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Not included in the cloud backup',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '• IPTV server addresses, playlist URLs, provider usernames, '
                        'passwords, and access tokens.\n'
                        '• Favorites, viewing history, custom widget titles and provider category bindings.',
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'You may cancel now, use the player without a cloud account, '
                        'or delete your saved cloud settings later. '
                        'Google Firebase has its own privacy policies.',
                      ),
                      const SizedBox(height: 10),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: acknowledged,
                        title: const Text(
                          'I understand and agree to send the account information described above to Firebase.',
                        ),
                        onChanged: (value) =>
                            setDialogState(() => acknowledged = value ?? false),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(false),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: acknowledged
                      ? () => Navigator.of(dialogContext).pop(true)
                      : null,
                  child: const Text('I Agree — Create Account'),
                ),
              ],
            ),
          ),
        ) ??
        false;
  }

  Future<void> _submitCredentials() async {
    if (register && !await _confirmAccountDataDisclosure()) return;
    if (!mounted) return;
    await run(
      () async {
        if (register) { await client.signUp(email.text, password.text); }
        else { await client.signIn(email.text, password.text); }
        password.clear();
        await _refreshBackups();
      },
      success: 'Signed in successfully.',
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    client.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (localDataOnly) {
      return Scaffold(
        appBar: AppBar(title: const Text('Local data & privacy')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'This edition stores accounts, credentials, settings and viewing history on this device. Cloud registration and synchronization are disabled. IPTV streams and artwork still contact the provider you choose. Uninstalling never deletes a cloud account.',
            ),
          ),
        ),
      );
    }
    final model = context.read<LibraryModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Account & Cloud Sync')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(
                'Cloud settings for ${CloudSyncConfig.appLabel}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 14),
              if (busy) const LinearProgressIndicator(),
              if (status != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    status!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              if (!client.signedIn) ...[
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  decoration: const InputDecoration(labelText: 'Email address'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: password,
                  obscureText: true,
                  autofillHints: [
                    register
                        ? AutofillHints.newPassword
                        : AutofillHints.password,
                  ],
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: busy ? null : _submitCredentials,
                  child: Text(register ? 'Create account' : 'Sign in'),
                ),
                TextButton(
                  onPressed: busy
                      ? null
                      : () => setState(() => register = !register),
                  child: Text(
                    register
                        ? 'Already registered? Sign in'
                        : 'New user? Create account',
                  ),
                ),
                TextButton(
                  onPressed: busy
                      ? null
                      : () => run(
                          () => client.sendPasswordReset(email.text),
                          success: 'If the account exists, Firebase will send password reset instructions.',
                        ),
                  child: const Text('Forgot password? Send reset email'),
                ),
              ] else ...[
                ListTile(
                  leading: const Icon(Icons.account_circle_outlined),
                  title: Text(client.email ?? 'Signed in'),
                  subtitle: const Text(
                    'Signed in to the free Firebase account service',
                  ),
                ),
                ..._backupControls(model),
                const Divider(),
                FilledButton.icon(
                  icon: const Icon(Icons.cloud_upload_outlined),
                  label: const Text('Save current theme to cloud'),
                  onPressed: busy
                      ? null
                      : () => run(
                          () => client.saveTheme(model.prefs.bstvTheme),
                          success: 'Theme backed up to cloud.',
                        ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  icon: const Icon(Icons.cloud_download_outlined),
                  label: const Text('Restore theme from cloud'),
                  onPressed: busy
                      ? null
                      : () => run(() async {
                          final incoming = await client.loadTheme();
                          if (incoming == null) {
                            throw const CloudSyncException(
                              'No cloud backup has been saved for this edition.',
                            );
                          }
                          if (!mounted) return;
                          if (await _confirm(
                            'Replace current theme?',
                            'Your current appearance and active dashboard layout will be replaced. Your IPTV accounts and media data stay unchanged. Export your current theme first if you want a permanent backup.',
                            'Restore',
                          )) {
                            await model.applyBstvTheme(incoming);
                          }
                        }, success: 'Restore finished.'),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  icon: const Icon(Icons.mark_email_read_outlined),
                  label: const Text('Send email verification'),
                  onPressed: busy
                      ? null
                      : () => run(
                          client.sendVerificationEmail,
                          success: 'Verification email requested.',
                        ),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text('Sign out'),
                  onPressed: busy
                      ? null
                      : () => run(() async { await client.signOut(); if (mounted) setState(() { backups = []; backupsLoaded = false; accountInfo = null; }); }, success: 'Signed out.'),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Delete current cloud theme'),
                  onPressed: busy
                      ? null
                      : () => run(() async {
                          if (await _confirm(
                            'Delete cloud backup?',
                            'This removes the current cloud theme only. Named backups and local settings are kept.',
                            'Delete',
                          )) {
                            await client.deleteCloudTheme();
                          }
                        }, success: 'Cloud operation finished.'),
                ),
                TextButton(
                  onPressed: busy
                      ? null
                      : () => run(() async {
                          if (await _confirm(
                            'Delete Firebase account?',
                            'This deletes your shared Firebase login and all cloud backups for BOTH editions. Local IPTV data is kept. You may need to sign in again before account deletion.',
                            'Delete account',
                          )) {
                            await client.deleteAccount();
                          }
                        }, success: 'Account operation finished.'),
                  child: const Text('Delete my Firebase account'),
                ),
              ],
              const SizedBox(height: 20),
              const Text(
                'Cloud sync is manual. Five named appearance backups are available per app, separate from the current cloud theme.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
