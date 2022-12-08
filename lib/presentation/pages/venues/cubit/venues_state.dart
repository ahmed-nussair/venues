part of 'venues_cubit.dart';

abstract class VenuesState extends Equatable {
  const VenuesState();

  @override
  List<Object> get props => [];
}

class VenuesInitial extends VenuesState {}

class LoadingState extends VenuesState {}

class SuccessSate extends VenuesState {
  final List<Venue> venues;

  const SuccessSate({required this.venues});
  @override
  List<Object> get props => [venues];
}

class FailureState extends VenuesState {
  final String failureMessage;

  const FailureState({required this.failureMessage});
  @override
  List<Object> get props => [failureMessage];
}
