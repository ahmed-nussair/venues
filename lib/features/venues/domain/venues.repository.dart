import 'package:venues/core/constants/pagination.core.dart';
import 'package:venues/core/failure/base.core.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';

abstract class VenuesRepository {
  /// Gets venues list with specified size and offset.
  /// Size and offset have default values and can be
  /// modified.
  Future<Fallible<List<Venue>>> getVenuesList({
    int size = defaultPageSize,
    int offset = defaultStartIndex,
  });
}
