import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'base_scaffold_state.dart';

class BaseScaffoldCubit extends Cubit<BaseScaffoldState> {
  BaseScaffoldCubit() : super(const HomeState());

  void pickItem(int i) {
    switch (i) {
      case 0:
        emit(const HomeState());
        break;
      case 1:
        emit(const CalendarState());
        break;
      case 2:
        emit(const ProgressState());
        break;
      case 3:
        emit(const ProfileState());
        break;
      case 4:
        emit(const BuddiesScreenState());
        break;
    }
  }

  void goToHomeScreen() => emit(const HomeState());

  void goToBuddyScreen() => emit(const BuddiesScreenState());
}
