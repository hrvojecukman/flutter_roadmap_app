import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_template_firebase/cubits/base_scaffold/base_scaffold_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseScaffoldCubit, BaseScaffoldState>(
      builder: (context, baseScaffoldState) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          currentIndex: baseScaffoldState.tabs.indexOf(
            baseScaffoldState.selectedTab,
          ),
          onTap: BlocProvider.of<BaseScaffoldCubit>(context).changeTab,
          items: baseScaffoldState.tabs
              .map((e) => myBottomNavigationBarItem(Icons.close, e.title))
              .toList(),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blue,
        );
      },
    );
  }

  BottomNavigationBarItem myBottomNavigationBarItem(
    IconData icon,
    String title,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: title,
    );
  }
}
