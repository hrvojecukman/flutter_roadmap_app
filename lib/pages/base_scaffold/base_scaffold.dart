import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_template_firebase/cubits/base_scaffold/base_scaffold_cubit.dart';
import 'package:login_template_firebase/pages/base_scaffold/widgets/custom_bottom_navigation_bar.dart';
import 'package:login_template_firebase/pages/page_1/page_1.dart';
import 'package:login_template_firebase/pages/page_2/page_2.dart';
import 'package:login_template_firebase/pages/page_3/page_3.dart';
import 'package:login_template_firebase/pages/page_4/page_4.dart';
import 'package:login_template_firebase/pages/page_5/page_5.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({Key? key}) : super(key: key);

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  void initState() {
    super.initState();
    // if (WidgetsBinding.instance != null) {
    //   WidgetsBinding.instance!.addPostFrameCallback((_) {
    //     if (widget.referredBy != null) {
    //       print("Reffered by");
    //       print(widget.referredBy);
    //       Dialogs.newBuddy(context: context);
    //     }
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<BaseScaffoldCubit, BaseScaffoldState>(
          builder: (context, baseScaffoldState) {
            if (baseScaffoldState is HomeState) {
              return Page1(title: baseScaffoldState.toString());
            } else if (baseScaffoldState is CalendarState) {
              return Page2(title: baseScaffoldState.toString());
            } else if (baseScaffoldState is ProgressState) {
              return Page3(title: baseScaffoldState.toString());
            } else if (baseScaffoldState is ProfileState) {
              return Page4(title: baseScaffoldState.toString());
            } else if (baseScaffoldState is BuddiesScreenState) {
              return Page5(title: baseScaffoldState.toString());
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
