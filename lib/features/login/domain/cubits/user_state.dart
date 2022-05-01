part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  final AppUser? appUser;

  const UserState(this.appUser);

  @override
  List<Object?> get props => [appUser];
}

class UserLoggedOut extends UserState {
  const UserLoggedOut() : super(null);
}

class UserWaitingForAgreement extends UserState {
  final bool isApple;
  final bool isGoogle;

  const UserWaitingForAgreement({
    this.isApple = false,
    this.isGoogle = false,
  }) : super(null);
}

class UserLoading extends UserState {
  const UserLoading() : super(null);
}

class UserLoggedIn extends UserState {
  const UserLoggedIn(AppUser? appUser) : super(appUser);
}

class UserError extends UserState {
  final AppFailure error;

  const UserError(this.error) : super(null);

  @override
  List<Object?> get props => [appUser, error];
}
