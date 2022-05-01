import 'package:dartz/dartz.dart';
import 'package:login_template_firebase/common/errors/app_failure.dart';

typedef EitherAppFailureOr<T> = Future<Either<AppFailure, T>>;
