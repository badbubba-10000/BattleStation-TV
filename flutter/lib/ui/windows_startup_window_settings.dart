// Windows-only user-selected launch dimensions; no Android UI or behavior changes.
import 'dart:io';
import 'package:flutter/material.dart';

class WindowsStartupWindowSettings extends StatefulWidget {
  const WindowsStartupWindowSettings({super.key});
  @override
  State<WindowsStartupWindowSettings> createState() => _WindowsStartupWindowSettingsState();
}

class _WindowsStartupWindowSettingsState extends State<WindowsStartupWindowSettings> {
  static const _choices = <String, String>{
    '1280x720': '1280 × 720 — HD',
    '1600x900': '1600 × 900 — HD+',
    '1920x1080': '1920 × 1080 — Full HD',
    '2560x1440': '2560 × 1440 — QHD',
    '3840x2160': '3840 × 2160 — 4K UHD',
    'maximized': 'Maximized',
  };
  String _selection = '1920x1080';
  bool _remember = false, _center = true, _busy = true;
  String? _error;

  // Per-edition registry key; no access token or user credentials stored here.
  static const String _key = r'HKCU\Software\BattleStationTV\Window';

  Future<int?> _get(String name) async {
    final result = await Process.run('reg.exe', ['query', _key, '/v', name]);
    if (result.exitCode != 0) return null;
    final match = RegExp(r'REG_DWORD\s+(0x[0-9a-fA-F]+|\d+)').firstMatch(result.stdout.toString());
    final value = match?.group(1);
    if (value == null) return null;
    return value.startsWith('0x') ? int.tryParse(value.substring(2), radix: 16) : int.tryParse(value);
  }

  @override
  void initState() { super.initState(); _load(); }

  Future<void> _load() async {
    try {
      final width = await _get('Width');
      final height = await _get('Height');
      final max = await _get('Maximized');
      final remember = await _get('Remember');
      final center = await _get('Center');
      if (!mounted) return;
      final candidate = '${width ?? 1920}x${height ?? 1080}';
      setState(() {
        _selection = max == 1 ? 'maximized' : _choices.containsKey(candidate) ? candidate : '1920x1080';
        _remember = remember == 1;
        _center = center != 0;
        _busy = false;
      });
    } catch (_) { if(mounted) setState(() { _busy = false; _error = 'Unable to read Windows settings.'; }); }
  }

  Future<void> _save() async {
    setState(() { _busy = true; _error = null; });
    try {
      final pair = _selection == 'maximized' ? ['1920','1080'] : _selection.split('x');
      final values = <String, int>{'Width':int.parse(pair[0]), 'Height':int.parse(pair[1]),
        'Maximized': _selection == 'maximized' ? 1 : 0,
        'Remember': _remember ? 1 : 0, 'Center': _center ? 1 : 0};
      for (final entry in values.entries) {
        final result = await Process.run('reg.exe', ['add', _key, '/v', entry.key, '/t', 'REG_DWORD', '/d', '${entry.value}', '/f']);
        if (result.exitCode != 0) throw StateError('Windows rejected ${entry.key}');
      }
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Startup size saved. Close and reopen the app to apply.')));
    } catch (_) { if (mounted) setState(() => _error = 'Could not save Windows window preferences.'); }
    finally { if(mounted) setState(() => _busy=false); }
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isWindows) return const SizedBox.shrink();
    final display = View.of(context).display;
    final maximumWidth = display.size.width / display.devicePixelRatio;
    final maximumHeight = display.size.height / display.devicePixelRatio;
    // Monitor selection is based on this window's display; native startup
    // additionally clamps to the Windows work area to avoid off-screen UI.
    final options = _choices.entries.where((entry) {
      if(entry.key == 'maximized' || entry.key == _selection) return true;
      final parts = entry.key.split('x').map(int.parse).toList();
      return parts[0] <= maximumWidth && parts[1] <= maximumHeight;
    }).toList();
    return Card(child:Padding(padding:const EdgeInsets.all(12),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      const ListTile(leading:Icon(Icons.desktop_windows_outlined), title:Text('Display & Window — Windows only'),
        subtitle:Text('Choose the size used the next time this application opens. Larger sizes are limited by your monitor and Windows scaling.')),
      DropdownButtonFormField<String>(isExpanded:true, initialValue:options.any((e)=>e.key==_selection)?_selection:'1920x1080',
        decoration: const InputDecoration(labelText:'Startup Window Size', border:OutlineInputBorder()),
        items:[for(final entry in options) DropdownMenuItem(value:entry.key,child:Text(entry.value, maxLines:1, overflow:TextOverflow.ellipsis))],
        onChanged:_busy?null:(value){if(value!=null)setState(()=>_selection=value);}),
      SwitchListTile(title:const Text('Remember last window size instead'), value:_remember, onChanged:_busy?null:(v)=>setState(()=>_remember=v)),
      SwitchListTile(title:const Text('Center window on startup'),value:_center,onChanged:_busy?null:(v)=>setState(()=>_center=v)),
      if(_error != null) Text(_error!,style:TextStyle(color:Theme.of(context).colorScheme.error)),
      Align(alignment:Alignment.centerRight, child:FilledButton.icon(onPressed:_busy?null:_save, icon:const Icon(Icons.save_outlined), label:const Text('Save startup size'))),
    ])));
  }
}
