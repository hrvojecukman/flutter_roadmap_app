part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  final User? user;

  const AuthState(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(null);
}

class AuthLoading extends AuthState {
  const AuthLoading() : super(null);
}

class AuthPassed extends AuthState {
  const AuthPassed(User? user) : super(user);
}

class AuthError extends AuthState {
  final String error;

  const AuthError(this.error) : super(null);

  @override
  List<Object?> get props => [user, error];
}
