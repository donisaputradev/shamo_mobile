part of 'product_bloc.dart';

enum ProductStateStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  const ProductState({
    this.currentPage = 0,
    this.failure,
    this.categoryId = '',
    this.lastPage = 0,
    this.products = const [],
    this.status = ProductStateStatus.initial,
  });

  factory ProductState.initial() {
    return const ProductState();
  }

  final ProductStateStatus status;
  final List<Product> products;
  final int currentPage;
  final int lastPage;
  final String categoryId;
  final Failure? failure;

  ProductState copyWith({
    ProductStateStatus? status,
    List<Product>? products,
    int? currentPage,
    int? lastPage,
    String? categoryId,
    Failure? failure,
  }) {
    return ProductState(
      status: status ?? this.status,
      currentPage: currentPage ?? this.currentPage,
      failure: failure ?? this.failure,
      categoryId: categoryId ?? this.categoryId,
      lastPage: lastPage ?? this.lastPage,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        currentPage,
        failure,
        categoryId,
        lastPage,
        products,
        status,
      ];
}
