import 'package:dio/dio.dart';
import 'package:shamo_mobile/core/core.dart';
import 'package:shamo_mobile/features/product/product.dart';

abstract class ProductApiDataSource {
  Future<List<CategoryModel>> fetchCategories();

  Future<PaginationData<ProductModel>> fetchProducts({
    required int page,
    String? categoryId,
  });

  Future<ProductModel> fetchProduct(String id);
}

class ProductApiDataSourceImpl implements ProductApiDataSource {
  ProductApiDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<PaginationData<ProductModel>> fetchProducts({
    required int page,
    String? categoryId,
  }) async {
    try {
      final response = await dio.get('/products', queryParameters: {
        if (categoryId != null) 'category_id': categoryId,
        'page': page,
      });
      return PaginationData.fromJson(
        response.data['data'],
        (json) => ProductModel.fromJson(json),
      );
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  @override
  Future<ProductModel> fetchProduct(String id) async {
    try {
      final response = await dio.get('/products?id=$id');
      return ProductModel.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await dio.get('/categories');
      return (response.data['data']['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
