import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// Aliasing for Either<Failure,?>
typedef Fallible<T> = Either<Failure, T>;

/// Base class for all types of failures.
abstract class Failure implements Exception {
  final String? cause;
  final Error? error;

  Failure({
    this.cause,
    this.error,
  });
}

/// Base class for all Dio failures.
abstract class DioFailure extends Failure {
  final DioError dioError;

  DioFailure(this.dioError);

  String get title;
  String get subTitle;
}

/// Base class for all network failures.
abstract class NetworkFailure extends Failure {
  NetworkFailure({super.cause});
}
