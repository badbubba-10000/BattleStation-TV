import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:iptvmac/bstv/cloud_sync_service.dart';
import 'package:iptvmac/bstv/theme_package.dart';
void main(){
 TestWidgetsFlutterBinding.ensureInitialized();
 test('five named slots use individual reads; create/rename and edition deletion follow rule constraints',()async{
  FlutterSecureStorage.setMockInitialValues({});final requests=<http.Request>[];
  final client=CloudSyncClient(httpClient:MockClient((request)async{
   requests.add(request);
   if(request.url.host=='identitytoolkit.googleapis.com')return http.Response(jsonEncode({'idToken':'synthetic-token','refreshToken':'synthetic-refresh','localId':'synthetic-uid','email':'synthetic@example.invalid','expiresIn':'3600'}),200);
   return http.Response('{}',request.method=='GET'?404:200);
  }));
  await client.signIn('synthetic@example.invalid','not-a-real-password');
  expect(await client.listBackups(),isEmpty);
  final reads=requests.where((r)=>r.method=='GET').toList();expect(reads.length,5);
  for(var i=0;i<5;i++){expect(reads[i].url.path.endsWith('/backups/slot${i+1}'),isTrue);}
  await client.createBackup(1,'Movie Night',BstvThemePackage.defaults());
  final create=requests.last;expect(create.url.queryParameters['currentDocument.exists'],'false');
  expect(create.url.path,contains('/settings/${CloudSyncConfig.appId}/backups/slot1'));
  final now=DateTime.utc(2026,11,25).toIso8601String();
  final backup=CloudBackup(1,'Movie Night',BstvThemePackage.defaults(),now,now,now);
  await client.renameBackup(backup,'Sports');
  final rename=requests.last;final fields=(jsonDecode(rename.body) as Map)['fields'] as Map;
  expect(fields.keys.toSet(),{'name','updatedAt'});expect(rename.url.queryParametersAll['updateMask.fieldPaths'],['name','updatedAt']);
  final start=requests.length;await client.deleteEditionData(CloudSyncConfig.appId);
  final deletes=requests.sublist(start);expect(deletes.length,6);
  expect(deletes.every((r)=>r.method=='DELETE' && r.url.path.contains('/settings/${CloudSyncConfig.appId}')),isTrue);
  client.dispose();
 });
}
