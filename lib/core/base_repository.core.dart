import 'package:venues/core/constants/pagination.core.dart';
import 'package:venues/core/failure/base.core.dart';

abstract class BaseRepository<T> {
  Future<Fallible<List<T>>> getList({
    int size = defaultPageSize,
    int offset = defaultPageSize,
  });
}
