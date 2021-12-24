import 'package:flutter/material.dart';

import 'app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.DEV;
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}
