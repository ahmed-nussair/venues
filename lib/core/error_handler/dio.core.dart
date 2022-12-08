import 'package:dio/dio.dart';
import 'package:venues/core/failure/dio.core.dart';

/// Handles any Dio calls.
Future<T> handleDioCall<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on DioError catch (e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        throw FailureDioConnectionTimeOut(e);
      case DioErrorType.sendTimeout:
        throw FailureDioSendTimeOut(e);
      case DioErrorType.receiveTimeout:
        throw FailureDioReceiveTimeOut(e);
      case DioErrorType.response:
        throw FailureDioResponse(e);
      case DioErrorType.cancel:
        throw FailureDioCancel(e);
      case DioErrorType.other:
        rethrow;
    }
  }
}
