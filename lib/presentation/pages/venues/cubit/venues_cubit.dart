import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:venues/core/constants/pagination.core.dart';
import 'package:venues/features/venues/domain/entity/venue.entity.dart';
import 'package:venues/features/venues/domain/venues.repository.dart';

part 'venues_state.dart';

class VenuesCubit extends Cubit<VenuesState> {
  final VenuesRepository repository;
  VenuesCubit({required this.repository}) : super(VenuesInitial());

  void loadVenues({
    int size = defaultPageSize,
    int index = defaultStartIndex,
  }) async {
    emit(LoadingState());
    final result = await repository.getVenuesList(
      size: size,
      offset: index,
    );

    result.fold(
      (l) => emit(
        FailureState(
          failureMessage: l.cause.toString(),
        ),
      ),
      (r) => emit(
        SuccessSate(venues: r),
      ),
    );
  }
}
