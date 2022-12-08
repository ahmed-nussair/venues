import 'package:dartz/dartz.dart';
import 'package:venues/core/constants/pagination.core.dart';
import 'package:venues/features/venues/data/datasource/remote_venues.datasource.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';
import 'package:venues/core/failure/base.core.dart';
import 'package:venues/features/venues/domain/venues.repository.dart';

class VenuesRepositoryImpl extends VenuesRepository {
  final RemoteVenuesDataSource remoteDataSource;

  VenuesRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Fallible<List<Venue>>> getList({
    int size = defaultPageSize,
    int offset = defaultPageSize,
  }) async {
    try {
      final result = await remoteDataSource.getVenuesList(
        size: size,
        offset: offset,
      );
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
