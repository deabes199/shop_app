import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 12)
class CartModel {
  @HiveField(30)
  final int? id;
  @HiveField(31)
  final String? title;
  @HiveField(32)
  final String? image;
  @HiveField(33)
  final double? price;
  @HiveField(34)
  final int quantity;
  @HiveField(35)
  final String? category;

  CartModel(
      {required this.id,
      required this.category,
      required this.title,
      required this.image,
      required this.price,
      required this.quantity});

  factory CartModel.fromProduct(Product product) {
    return CartModel(
      id: product.id,
      title: product.title,
      image: product.mainImage,
      price: product.price,
      quantity: 1,
      category: product.category,

    );
  }
  CartModel copyWith({
    int? id,
    String? title,
    String? image,
    double? price,
    int? quantity,
    String? category,
  }) {
    return CartModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
    );
  }
}
