part of 'pagination_cubit.dart';

abstract class PaginationState<T> extends Equatable {
  final List<T> items;
  const PaginationState({required this.items});

  @override
  List<Object> get props => [items];
}

class PaginationInitial<T> extends PaginationState<T> {
  const PaginationInitial({required super.items});
}

class LoadingState<T> extends PaginationState<T> {
  final bool isFirstLoading;
  const LoadingState({
    required super.items,
    required this.isFirstLoading,
  });
  @override
  List<Object> get props => [items, isFirstLoading];
}

class SuccessState<T> extends PaginationState<T> {
  const SuccessState({required super.items});
}

class FailureState<T> extends PaginationState<T> {
  final String failureMessage;
  const FailureState({
    required super.items,
    required this.failureMessage,
  });
  @override
  List<Object> get props => [items, failureMessage];
}
