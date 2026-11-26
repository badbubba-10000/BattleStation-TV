import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:iptvmac/app/library_model.dart';

import 'feature_store.dart';
import 'guide_service.dart';
import 'dvr_service.dart';

class CoreServices extends ChangeNotifier {
  CoreServices(
    this.store,
    LibraryModel library,
    String recordingDirectory,
    GuideSecrets secrets, {
    http.Client? guideClient,
  }) : guide = GuideService(store, library, secrets, client: guideClient),
       dvr = DvrService(store, library, recordingDirectory) {
    guide.addListener(_guideChanged);
    dvr.addListener(notifyListeners);
  }
  final FeatureStore store;
  final GuideService guide;
  final DvrService dvr;
  String? storageWarning;
  Timer? _pulse;
  void _guideChanged() {
    dvr.applySeriesRules();
    notifyListeners();
  }

  void start() {
    guide.start();
    dvr.start();
    dvr.applySeriesRules();
    _pulse ??= Timer.periodic(
      const Duration(seconds: 30),
      (_) => notifyListeners(),
    );
  }

  @override
  void dispose() {
    _pulse?.cancel();
    guide.removeListener(_guideChanged);
    dvr.removeListener(notifyListeners);
    guide.dispose();
    dvr.dispose();
    super.dispose();
  }
}
