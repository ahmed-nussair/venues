import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:venues/core/constants/pagination.core.dart';
import 'package:venues/core/failure/base.core.dart';
part 'pagination_state.dart';

class PaginationCubit<T> extends Cubit<PaginationState<T>> {
  final Future<Fallible<List<T>>> Function() action;

  PaginationCubit({required this.action})
      : super(const PaginationInitial(items: []));

  int currentIndex = defaultStartIndex;
  bool isLoading = false;

  final List<T> _items = [];

  void query() async {
    if (isLoading) return;
    isLoading = true;
    emit(
      LoadingState(
        items: _items,
        isFirstLoading: currentIndex == defaultStartIndex,
      ),
    );
    final result = await action();
    result.fold(
      (l) => emit(
        FailureState(
          items: _items,
          failureMessage: l.cause.toString(),
        ),
      ),
      (r) {
        _items.addAll(r);
        emit(SuccessState(items: _items));
      },
    );
    currentIndex++;
    isLoading = false;
  }
}
