import 'package:dartz/dartz.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Category>>> fetchCategories();

  Future<Either<Failure, PaginationData<Product>>> fetchProducts({
    required int page,
    String? categoryId,
  });

  Future<Either<Failure, Product>> fetchProduct(String id);
}
