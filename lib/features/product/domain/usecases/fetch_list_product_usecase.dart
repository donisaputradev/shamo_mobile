import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';

class FetchListProductUseCase
    implements
        UseCaseFuture<Failure, PaginationData<Product>,
            FetchListProductParams> {
  FetchListProductUseCase(this.productRepository);

  final ProductRepository productRepository;

  @override
  Future<Either<Failure, PaginationData<Product>>> call(
      FetchListProductParams params) async {
    return await productRepository.fetchProducts(
      page: params.page,
      categoryId: params.categoryId,
    );
  }
}

class FetchListProductParams extends Equatable {
  const FetchListProductParams({
    required this.page,
    this.categoryId,
  });

  final int page;
  final String? categoryId;

  @override
  List<Object?> get props => [categoryId, page];
}
