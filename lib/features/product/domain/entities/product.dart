import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/features/product/product.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final String tags;
  final String price;
  final String productCategoryId;
  final Category category;
  final List<Gallery> galleries;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.price,
    required this.productCategoryId,
    required this.category,
    required this.galleries,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        tags,
        price,
        productCategoryId,
        category,
        galleries,
      ];
}
