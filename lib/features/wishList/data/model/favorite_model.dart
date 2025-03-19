import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'favorite_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 34)
class FavoriteModel {
  @HiveField(37)
  final int id;
  @HiveField(38)
  final String title;
  @HiveField(39)
  final String image;
  @HiveField(40)
  final double price;
  @HiveField(41)
  final String category;

  FavoriteModel(
      {required this.id,
      required this.category,
      required this.title,
      required this.image,
      required this.price});
  factory FavoriteModel.fromProduct(Product product) {
    return FavoriteModel(
        id: product.id ?? 0,
        category: product.category ?? '',
        title: product.title ?? '',
        image: product.mainImage ?? '',
        price: product.price ?? 0);
  }
}
