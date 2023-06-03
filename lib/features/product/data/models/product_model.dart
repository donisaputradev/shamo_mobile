import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/features/product/product.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String tags;
  final String price;
  final String productCategoryId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final CategoryModel category;
  final List<GalleryModel> galleries;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.tags,
    required this.price,
    required this.productCategoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
    required this.galleries,
  });

  Product toEntity() {
    return Product(
      category: category.toEntity(),
      description: description,
      galleries: galleries.map((e) => e.toEntity()).toList(),
      id: id,
      name: name,
      price: price,
      productCategoryId: productCategoryId,
      tags: tags,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        tags: json['tags'],
        price: json['price'],
        productCategoryId: json['product_category_id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        category: CategoryModel.fromJson(json['category']),
        galleries: List<GalleryModel>.from(
            json['galleries'].map((x) => GalleryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'tags': tags,
        'price': price,
        'product_category_id': productCategoryId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
        'category': category.toJson(),
        'galleries': List<dynamic>.from(galleries.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [
        id,
        name,
        description,
        tags,
        price,
        productCategoryId,
        createdAt,
        updatedAt,
        category,
        galleries,
      ];
}
