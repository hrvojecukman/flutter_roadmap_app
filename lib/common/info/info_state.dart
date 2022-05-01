part of 'info_cubit.dart';

abstract class InfoState extends Equatable {
  final String? title;
  final String? message;

  const InfoState({
    required this.title,
    required this.message,
  });

  @override
  List<Object?> get props => [message, title];
}

class InfoInitial extends InfoState {
  const InfoInitial() : super(title: null, message: null);
}

class ErrorHasOccurred extends InfoState {
  const ErrorHasOccurred({
    required String? title,
    required String? message,
  }) : super(title: title, message: message);
}

class ShowInfo extends InfoState {
  const ShowInfo({
    required String? title,
    required String? message,
  }) : super(title: title, message: message);
}
