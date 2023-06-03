import 'package:dartz/dartz.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';

class FetchCategoriesUseCase
    implements UseCaseFuture<Failure, List<Category>, NoParams> {
  FetchCategoriesUseCase(this.productRepository);

  final ProductRepository productRepository;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await productRepository.fetchCategories();
  }
}
