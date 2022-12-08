import 'package:venues/core/constants/pagination.core.dart';

class EndPoints {
  EndPoints._();

  static String venues({
    int size = defaultPageSize,
    int offset = defaultStartIndex,
  }) =>
      'venues?limit=$size&offset=$offset';
}
