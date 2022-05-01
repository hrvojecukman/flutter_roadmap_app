import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/firebase_options.dart';

import 'common/configuration/injection.dart';
import 'common/firebase/analytics.dart';
import 'common/flavors/flavors.dart';

Future<void> configMain(Flavor flavor) async {
  F.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  enableFirebaseAnalytics(flavor);
}
