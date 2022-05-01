import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_roadmap/pages/page_1/page_1.dart';
import 'package:flutter_roadmap/pages/page_2/page_2.dart';
import 'package:flutter_roadmap/pages/page_3/page_3.dart';
import 'package:flutter_roadmap/pages/page_4/page_4.dart';
import 'package:flutter_roadmap/pages/page_5/page_5.dart';

part 'base_scaffold_state.dart';

final adminAppTabs = [
  const AppTab(
    title: "Page1",
    page: Page1(),
  ),
  const AppTab(
    title: "Page2",
    page: Page2(),
  ),
  const AppTab(
    title: "Page3",
    page: Page3(),
  ),
  const AppTab(
    title: "Page4",
    page: Page4(),
  ),
  const AppTab(
    title: "Page5",
    page: Page5(),
  ),
];

class BaseScaffoldCubit extends Cubit<BaseScaffoldState> {
  BaseScaffoldCubit()
      : super(BaseScaffoldStateChanged(
          selectedTab: adminAppTabs.first,
          tabs: adminAppTabs,
        ));

  void changeTab(int index) {
    final selectedTab = state.tabs[index];
    emit(BaseScaffoldStateChanged(selectedTab: selectedTab, tabs: state.tabs));
  }

  void goToHomeScreen() => emit(BaseScaffoldStateChanged(
        selectedTab: state.tabs.first,
        tabs: state.tabs,
      ));
}
