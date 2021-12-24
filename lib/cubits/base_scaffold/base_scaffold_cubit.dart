import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'base_scaffold_state.dart';

class BaseScaffoldCubit extends Cubit<BaseScaffoldState> {
  BaseScaffoldCubit() : super(HomeState());

  void pickItem(int i) {
    switch (i) {
      case 0:
        emit(HomeState());
        break;
      case 1:
        emit(CalendarState());
        break;
      case 2:
        emit(ProgressState());
        break;
      case 3:
        emit(ProfileState());
        break;
      case 4:
        emit(BuddiesScreenState());
        break;
    }
  }

  void goToHomeScreen() => emit(HomeState());

  void goToBuddyScreen() => emit(BuddiesScreenState());
}
