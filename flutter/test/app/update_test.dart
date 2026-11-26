import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/app/device.dart';
import 'package:iptvmac/core/release_update.dart';
import 'package:iptvmac/core/app_database.dart';
import 'package:iptvmac/core/secret_store.dart';
import '../core/release_update_test.dart' show fixture, FakeInstallHost;
void main(){
 test('LibraryModel delegates startup/manual checks, does not transmit IPTV account state, and respects settings',()async{
  SharedPreferences.setMockInitialValues({});final prefs=await SharedPreferences.getInstance();
  final dir=await Directory.systemTemp.createTemp('model-update-test-');addTearDown(()=>dir.delete(recursive:true));
  final requests=<http.Request>[];
  final identity=UpdateIdentity.current;
  final client=ReleaseClient(identity:identity,client:MockClient((r)async{requests.add(r);return http.Response(jsonEncode(fixture(identity:identity,platform:'android')),200);}));
  final db=AppDatabase.memory();final before=isDesktop;isDesktop=false;addTearDown(()=>isDesktop=before);
  final model=LibraryModel(db:db,secrets:MemorySecretStore(),prefs:prefs,dbPath:':memory:',appVersion:'2.4.0+7',autoRefresh:false,updateClient:client,updateHost:FakeInstallHost(dir));
  await model.checkForUpdate(manual:true);
  expect(model.updateAvailable,'2.5.0+8');expect(model.newerVersion,'2.5.0+8');
  expect(requests.single.url,identity.endpoint(false));
  expect(requests.single.headers.containsKey('Authorization'),isFalse);
  model.setAutoCheckUpdates(false);await Future<void>.delayed(Duration.zero);
  await model.checkForUpdate();expect(requests.length,1);
  await model.checkForUpdate(manual:true);expect(requests.length,2);
  model.dismissUpdate();await Future<void>.delayed(Duration.zero);expect(model.updateAvailable,isNull);expect(model.newerVersion,'2.5.0+8');
  expect(prefs.getString('updates.v2.skip'),isNull,reason:'dismiss means remind, not skip');
  model.dispose();db.close();
 });
}
