import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_template_firebase/common/theme/app_sizes.dart';
import 'package:login_template_firebase/common/widgets/custom_loading_indicator.dart';
import 'package:login_template_firebase/cubits/auth_cubit.dart';
import 'package:login_template_firebase/features/login/domain/cubits/user_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) {
          return Stack(
            children: [
              _LoginPage(userState: userState),
              if (userState is UserLoading) const CustomLoadingIndicator(),
            ],
          );
        },
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  final UserState userState;

  const _LoginPage({
    Key? key,
    required this.userState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        final isApple = authState.user?.providerData.first.providerId ==
            ProviderId.apple.text;
        final isGoogle = authState.user?.providerData.first.providerId ==
            ProviderId.google.text;
        return Padding(
          padding: const EdgeInsets.all(AppSizes.spacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Start"),
                    const SizedBox(height: AppSizes.largeSpacing),
                    const Text("Sign in"),
                    const SizedBox(height: AppSizes.spacing),
                    SignInButton(
                      Buttons.Google,
                      onPressed:
                          BlocProvider.of<AuthCubit>(context).signInWithGoogle,
                      shape: appShape,
                      elevation: 0,
                    ),
                    const SizedBox(height: AppSizes.smallSpacing),
                    SignInButton(
                      Buttons.Apple,
                      onPressed:
                          BlocProvider.of<AuthCubit>(context).signInWithApple,
                      shape: appShape,
                      elevation: 0,
                    ),
                    const SizedBox(height: AppSizes.largeSpacing),
                  ],
                ),
              ),
              // const LoginWithCredentialsForm(),
            ],
          ),
        );
      },
    );
  }
}
