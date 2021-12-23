import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_template_firebase/base_scaffold.dart';
import 'package:login_template_firebase/cubits/auth_cubit.dart';
import 'package:login_template_firebase/login_page.dart';

import 'firebase_options.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return const Text("Error");
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (BuildContext context) => AuthCubit(),
                  ),
                ],
                child: BlocBuilder<AuthCubit, User?>(
                  builder: (context, user) {
                    if (user != null) {
                      return const BaseScaffold();
                    }
                    return const LoginPage();
                  },
                ),
              );
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
