import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_template_firebase/cubits/base_scaffold/base_scaffold_cubit.dart';
import 'package:login_template_firebase/features/login/domain/cubits/user_cubit.dart';
import 'package:login_template_firebase/pages/base_scaffold/widgets/custom_bottom_navigation_bar.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is! UserLoggedIn) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return BlocConsumer<BaseScaffoldCubit, BaseScaffoldState>(
          listener: (context, baseScaffoldState) {
            ///Tracking screen changes and logging them to analytics
            //TODO: move back
            // analytics.setCurrentScreen(
            //   screenName: baseScaffoldState.toString(),
            // );
          },
          builder: (context, baseScaffoldState) {
            return Scaffold(
              appBar: AppBar(title: Text(baseScaffoldState.selectedTab.title)),
              drawer: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Drawer(
                  child: Column(
                    children: const [],
                  ),
                ),
              ),
              body: baseScaffoldState.selectedTab.page,
              bottomNavigationBar: const CustomBottomNavigationBar(),
            );
          },
        );
      },
    );
  }
}
