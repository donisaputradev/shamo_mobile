import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc({
    required this.fetchListProductUseCase,
  }) : super(ProductState.initial()) {
    on<GetListProductEvent>((event, emit) async {
      try {
        emit(state.copyWith(
          status: ProductStateStatus.loading,
          categoryId: event.categoryId,
        ));
        final usecase = await fetchListProductUseCase(FetchListProductParams(
          page: event.page,
          categoryId: event.categoryId,
        ));
        usecase.fold(
          (l) {
            emit(state.copyWith(
              status: ProductStateStatus.failure,
              failure: l,
            ));
          },
          (r) {
            emit(state.copyWith(
              status: ProductStateStatus.success,
              products: r.data,
              currentPage: r.currentPage,
              lastPage: r.currentPage,
            ));
          },
        );
      } catch (exception, stackTrace) {
        exception.recordError(
          RecordErrorParams(exception: exception, stackTrace: stackTrace),
        );
      }
    });
  }

  final FetchListProductUseCase fetchListProductUseCase;
}
