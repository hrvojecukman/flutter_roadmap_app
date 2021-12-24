part of 'base_scaffold_cubit.dart';

abstract class BaseScaffoldState extends Equatable {
  final int index;

  const BaseScaffoldState(this.index);

  @override
  List<Object> get props => [index];
}

class HomeState extends BaseScaffoldState {
  const HomeState() : super(0);
}

class CalendarState extends BaseScaffoldState {
  const CalendarState() : super(1);
}

class ProgressState extends BaseScaffoldState {
  const ProgressState() : super(2);
}

class ProfileState extends BaseScaffoldState {
  const ProfileState() : super(3);
}

class BuddiesScreenState extends BaseScaffoldState {
  const BuddiesScreenState() : super(4);
}
