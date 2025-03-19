import 'package:bloc/bloc.dart';
import 'package:hero_store_app/core/database/hive_service.dart';
import 'package:hero_store_app/features/cart/data/model/cart_model.dart';
import 'package:meta/meta.dart';

part 'add_carts_state.dart';

class AddCartsCubit extends Cubit<AddCartsState> {
  AddCartsCubit() : super(AddCartsInitial());

  List<CartModel> cartList = [];

  Future<void> addQuantity(CartModel product) async {
    int index = cartList.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      cartList[index] = cartList[index].copyWith(
        quantity: cartList[index].quantity + 1,
      );
      await HiveServices.updateProductInCart(cartList[index]);
      emit(ChangeQuantity(quantity: cartList[index].quantity));
    }
  }

  void minusQuantity(CartModel product) async {
    int index = cartList.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      if (cartList[index].quantity > 1) {
        cartList[index] = cartList[index].copyWith(
          quantity: cartList[index].quantity - 1,
        );
        await HiveServices.updateProductInCart(cartList[index]);
        emit(ChangeQuantity(quantity: cartList[index].quantity));
      } else {
        await HiveServices.deleteProductFromCart(cartList[index].id ?? 0);
        cartList.removeAt(index);
        emit(RemoveProductFromCartSuccess(products: cartList));
      }
    }
  }

  bool productInCart(CartModel product) {
    return cartList.any((elment) => elment.id == product.id);
  }

  void addProdcutToCart({required CartModel product}) async {
    if (productInCart(product)) {
      await HiveServices.deleteProductFromCart(product.id ?? 0);
      cartList.removeWhere((element) => element.id == product.id);
      emit(RemoveProductFromCartSuccess(products: cartList));
    } else {
      cartList.add(product);
      await HiveServices.addProductToCart(product: product);
      emit(AddProductToCartSuccess());
    }
  }

  void getCartList() async {
    List<CartModel> savedList = await HiveServices.getProductFromCart();
    cartList = savedList;
    emit(GetCartSuccess(cartList));
  }

  Future<void> removeProductFromCart(CartModel product) async {
    await HiveServices.deleteProductFromCart(product.id ?? 0);
    cartList.removeWhere((element) => element.id == product.id);
    emit(RemoveProductFromCartSuccess(products: cartList));
  }

  Future<void> clearAllProductFromCart() async {
    await HiveServices.clearAllFromCart();
    cartList.clear();
    emit(ClearCartSuccess(products: cartList));
  }

  double totalPriceInCart(List<CartModel> items) {
    double total = 0;
    for (CartModel cart in items) {
      total += (cart.price ?? 0) * cart.quantity;   
    }
    return total;      
  }

  int totalItemsInCart(List<CartModel> items) {
    int total = 0;
    for (CartModel cart in items) {
      total += cart.quantity;
    }
    return total;
  }
}
