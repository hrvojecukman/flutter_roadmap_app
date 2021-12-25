import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'common/flavors/flavors.dart';
import 'cubits/my_bloc_observer.dart';

void main() {
  F.appFlavor = Flavor.DEV;
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: MyBlocObserver(),
  );
}
