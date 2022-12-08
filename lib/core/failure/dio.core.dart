import 'base.core.dart';

class FailureDioConnectionTimeOut extends DioFailure {
  FailureDioConnectionTimeOut(super.dioError);

  @override
  // TODO: implement subTitle
  String get subTitle => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
}

class FailureDioSendTimeOut extends DioFailure {
  FailureDioSendTimeOut(super.dioError);

  @override
  // TODO: implement subTitle
  String get subTitle => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
}

class FailureDioReceiveTimeOut extends DioFailure {
  FailureDioReceiveTimeOut(super.dioError);

  @override
  // TODO: implement subTitle
  String get subTitle => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
}

class FailureDioResponse extends DioFailure {
  FailureDioResponse(super.dioError);

  @override
  String get subTitle => dioError.response?.data['error_description'] ?? '';

  @override
  String get title => dioError.response?.data['error'] ?? '';
}

class FailureDioCancel extends DioFailure {
  FailureDioCancel(super.dioError);

  @override
  // TODO: implement subTitle
  String get subTitle => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();
}
