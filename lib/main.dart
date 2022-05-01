import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/common/flavors/flavors.dart';

import 'app.dart';
import 'config_main.dart';
import 'cubits/my_bloc_observer.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await configMain(flavor);
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: MyBlocObserver(),
  );
}
