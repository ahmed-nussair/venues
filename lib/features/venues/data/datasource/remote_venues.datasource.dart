import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:venues/core/constants/pagination.core.dart';
import 'package:venues/core/end_points.core.dart';
import 'package:venues/core/error_handler/dio.core.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';

abstract class RemoteVenuesDataSource {
  Future<List<Venue>> getVenuesList({
    int size = defaultPageSize,
    int offset = defaultStartIndex,
  });
}

class DioVenuesDataSource extends RemoteVenuesDataSource {
  final Dio dio;

  DioVenuesDataSource({required this.dio});

  @override
  Future<List<Venue>> getVenuesList(
          {int size = defaultPageSize, int offset = defaultStartIndex}) =>
      handleDioCall(() async {
        final result = await dio.get(
          EndPoints.venues(
            size: size,
            offset: offset,
          ),
          options: buildCacheOptions(
            const Duration(days: 7),
          ),
        );
        return (result.data['venues'] as List)
            .map(
              (e) => Venue.fromMap(e),
            )
            .toList();
      });
}
