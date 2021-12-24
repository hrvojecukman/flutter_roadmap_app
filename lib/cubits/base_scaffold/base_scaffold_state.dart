part of 'base_scaffold_cubit.dart';

abstract class BaseScaffoldState extends Equatable {
  final int index;

  BaseScaffoldState(this.index);

  @override
  List<Object> get props => [index];
}

class HomeState extends BaseScaffoldState {
  HomeState() : super(0);
}

class CalendarState extends BaseScaffoldState {
  CalendarState() : super(1);
}

class ProgressState extends BaseScaffoldState {
  ProgressState() : super(2);
}

class ProfileState extends BaseScaffoldState {
  ProfileState() : super(3);
}

class BuddiesScreenState extends BaseScaffoldState {
  BuddiesScreenState() : super(4);
}
