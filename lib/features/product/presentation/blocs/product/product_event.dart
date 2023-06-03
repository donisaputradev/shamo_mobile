part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class GetListProductEvent extends ProductEvent {
  final int page;
  final String categoryId;

  const GetListProductEvent({
    required this.page,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [page, categoryId];
}
