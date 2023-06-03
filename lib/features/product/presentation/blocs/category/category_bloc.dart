import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({required this.fetchCategoriesUseCase})
      : super(CategoryInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      try {
        emit(CategoryLoading());
        final usecase = await fetchCategoriesUseCase(const NoParams());
        usecase.fold(
          (l) {
            emit(CategoryFailure(l));
          },
          (r) {
            emit(CategorySuccess(r));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final FetchCategoriesUseCase fetchCategoriesUseCase;
}
