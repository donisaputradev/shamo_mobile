import 'package:dartz/dartz.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this.productApiDataSource);

  final ProductApiDataSource productApiDataSource;

  @override
  Future<Either<Failure, Product>> fetchProduct(String id) async {
    try {
      final result = await productApiDataSource.fetchProduct(id);
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, PaginationData<Product>>> fetchProducts({
    required int page,
    String? categoryId,
  }) async {
    try {
      final result = await productApiDataSource.fetchProducts(
        page: page,
        categoryId: categoryId,
      );
      final entity = PaginationData<Product>(
        currentPage: result.currentPage,
        data: result.data.map((e) => e.toEntity()).toList(),
        lastPage: result.lastPage,
      );
      return Right(entity);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> fetchCategories() async {
    try {
      final result = await productApiDataSource.fetchCategories();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }
}
