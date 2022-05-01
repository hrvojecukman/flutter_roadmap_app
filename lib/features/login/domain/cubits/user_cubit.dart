import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:login_template_firebase/common/configuration/injection.dart';
import 'package:login_template_firebase/common/errors/app_failure.dart';
import 'package:login_template_firebase/common/info/info_cubit.dart';
import 'package:login_template_firebase/cubits/auth_cubit.dart';
import 'package:login_template_firebase/features/login/repository/user_repository.dart';
import 'package:login_template_firebase/models/app_user.dart';

part 'user_state.dart';

@LazySingleton()
class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  StreamSubscription<AppUser?>? _userStreamSubscription;

  UserCubit(this._userRepository) : super(const UserLoggedOut());

  Future<void> _createNewUser() async {
    final response = await _userRepository.createNewUser();
    response.fold(
      _emitError,
      (r) => locator<InfoCubit>().showInfo("User created successfully!"),
    );
  }

  Future<void> acceptTerms() async {
    emit(const UserLoading());
    if (await _userRepository.isNewUser()) {
      await _createNewUser();
      startListening();
    }
  }

  Future<void> isNewUser() async {
    emit(const UserLoading());
    if (await _userRepository.isNewUser()) {
      emit(const UserWaitingForAgreement());
    } else {
      startListening();
    }
  }

  void startListening() {
    _userStreamSubscription =
        _userRepository.getUserStream().listen((rollPlusUser) {
      if (rollPlusUser == null) {
        locator<AuthCubit>().signOut();
      } else {
        emit(UserLoggedIn(rollPlusUser));
      }
    });
  }

  DocumentReference? getUserReference() {
    return _userRepository.getCurrentUserReference();
  }

  Future<void> signOut() async {
    _stopListening();
    emit(const UserLoggedOut());
  }

  Future<void> _stopListening() async {
    await _userStreamSubscription?.cancel();
  }

  _emitError(AppFailure error) {
    emit(UserError(error));
    locator<InfoCubit>().errorOccurred(error);
    emit(const UserLoggedOut());
  }
}
