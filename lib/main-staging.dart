import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'common/flavors/flavors.dart';
import 'config_main.dart';
import 'cubits/my_bloc_observer.dart';

final flavor = Flavor.STAGING;

void main() {
  configMain(flavor);

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: MyBlocObserver(),
  );
}
