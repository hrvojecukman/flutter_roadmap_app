import 'package:flutter/material.dart';

import 'common/firebase/analytics.dart';
import 'common/flavors/flavors.dart';

void configMain(Flavor flavor) {
  F.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  enableFirebaseAnalytics(flavor);
}
