import 'package:dartz/dartz.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';

class FetchProductUseCase implements UseCaseFuture<Failure, Product, String> {
  FetchProductUseCase(this.productRepository);

  final ProductRepository productRepository;

  @override
  Future<Either<Failure, Product>> call(String params) async {
    return await productRepository.fetchProduct(params);
  }
}
