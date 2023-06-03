import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';
import 'package:shamo_mobile/features/settings/settings.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc({required this.fetchListProductUseCase})
      : super(PopularInitial()) {
    on<GetPopularProductEvent>((event, emit) async {
      try {
        emit(PopularLoading());
        final usecase = await fetchListProductUseCase(
          const FetchListProductParams(page: 1),
        );
        usecase.fold(
          (l) {
            emit(PopularFailure(l));
          },
          (r) {
            emit(PopularSuccess(r.data));
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
