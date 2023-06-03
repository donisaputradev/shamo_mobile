import 'package:equatable/equatable.dart';
import 'package:shamo_mobile/features/product/product.dart';

class GalleryModel extends Equatable {
  final String id;
  final String url;
  final String productId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const GalleryModel({
    required this.id,
    required this.url,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  Gallery toEntity() {
    return Gallery(id: id, url: url);
  }

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        id: json['id'],
        url: json['url'],
        productId: json['product_id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'product_id': productId,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  List<Object> get props => [id, url, productId, createdAt, updatedAt];
}
