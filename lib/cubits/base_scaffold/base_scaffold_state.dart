part of 'base_scaffold_cubit.dart';

abstract class BaseScaffoldState extends Equatable {
  final List<AppTab> tabs;
  final AppTab selectedTab;

  const BaseScaffoldState({
    required this.tabs,
    required this.selectedTab,
  });

  @override
  List<Object> get props => [tabs, selectedTab];
}

class BaseScaffoldStateChanged extends BaseScaffoldState {
  const BaseScaffoldStateChanged({
    required AppTab selectedTab,
    required List<AppTab> tabs,
  }) : super(selectedTab: selectedTab, tabs: tabs);
}

class AppTab extends Equatable {
  final String title;
  final Widget page;

  const AppTab({
    required this.title,
    required this.page,
  });

  @override
  List<Object?> get props => [title, page];
}
