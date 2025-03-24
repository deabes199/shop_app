import 'package:hero_store_app/features/cart/data/model/cart_model.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:hero_store_app/features/wishList/data/model/favorite_model.dart';
import 'package:hive/hive.dart';

class HiveServices {
  static const String favBox = 'favorite';
  static late Box<FavoriteModel> favoriteBox;
  static const String cart = 'cart';
  static late Box<CartModel> cartBox;
  static const String user = 'user';
  static late Box<SignupResponseModel> userBox;

  static Future<void> init() async {
    favoriteBox = await Hive.openBox<FavoriteModel>(favBox);
    cartBox = await Hive.openBox<CartModel>(cart);
    userBox = await Hive.openBox<SignupResponseModel>(user);
  }

  static addproductToFavorite({required FavoriteModel product}) async {
    await favoriteBox.put(product.id, product);
  }

  static Future<List<FavoriteModel>> getProductFromFavorite() async {
    return favoriteBox.values.toList();
  }

  static Future<void> deleteProductFromFavorite(int id) async {
    await favoriteBox.delete(id);
  }

  static Future<void> clearAllFavorite() async {
    await favoriteBox.clear();
  }

  static addProductToCart({required CartModel product}) async {
    await cartBox.put(product.id, product);
  }

  static Future<List<CartModel>> getProductFromCart() async {
    return cartBox.values.toList();
  }

  static Future<void> deleteProductFromCart(int id) async {
    await cartBox.delete(id);
  }

  static Future<void> clearAllFromCart() async {
    await cartBox.clear();
  }

  static Future<void> updateProductInCart(CartModel product) async {
    if (cartBox.containsKey(product.id)) {
      await cartBox.put(product.id, product);
    }
  }
}
