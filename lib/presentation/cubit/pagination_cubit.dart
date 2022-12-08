import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:venues/core/base_repository.core.dart';
import 'package:venues/core/constants/pagination.core.dart';
part 'pagination_state.dart';

class PaginationCubit<T> extends Cubit<PaginationState<T>> {
  final BaseRepository repository;

  PaginationCubit({required this.repository})
      : super(const PaginationInitial(items: []));

  int currentIndex = defaultStartIndex;
  bool isLoading = false;

  final List<T> _items = [];

  void query({
    int index = defaultStartIndex,
    int size = defaultPageSize,
  }) async {
    if (isLoading) return;
    isLoading = true;
    emit(
      LoadingState(
        items: _items,
        isFirstLoading: currentIndex == defaultStartIndex,
      ),
    );
    final result = await repository.getList(
      offset: index,
      size: size,
    );
    result.fold(
      (l) => emit(
        FailureState(
          items: _items,
          failureMessage: l.cause.toString(),
        ),
      ),
      (r) {
        _items.addAll(r as List<T>);
        emit(SuccessState(items: _items));
      },
    );
    currentIndex++;
    isLoading = false;
  }
}
