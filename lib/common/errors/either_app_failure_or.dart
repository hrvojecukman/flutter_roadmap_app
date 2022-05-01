import 'package:dartz/dartz.dart';
import 'package:flutter_roadmap/common/errors/app_failure.dart';

typedef EitherAppFailureOr<T> = Future<Either<AppFailure, T>>;
