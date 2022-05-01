import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_roadmap/common/errors/app_failure.dart';

part 'info_state.dart';

@LazySingleton()
class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(const InfoInitial());

  void errorOccurred(AppFailure appFailure) {
    emit(ErrorHasOccurred(
      title: appFailure.title,
      message: appFailure.message,
    ));
    reset();
  }

  void showInfo(
    String title, {
    String? message,
  }) {
    emit(ShowInfo(
      message: message,
      title: title,
    ));
    reset();
  }

  void reset() => emit(const InfoInitial());
}
