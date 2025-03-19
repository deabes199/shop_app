import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hero_store_app/core/database/hive_service.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:hero_store_app/features/products/data/models/product_model.dart';
import 'package:hero_store_app/features/wishList/data/model/favorite_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(ProductDetailsInitial());

  SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  List<FavoriteModel> favoriteList = [];
  bool productIsFavorite(FavoriteModel favorite) {
    return favoriteList.any((elment) => elment.id == favorite.id);
  }

  void addProductInfavorite(FavoriteModel model) async {
    if (productIsFavorite(model)) {
      await HiveServices.deleteProductFromFavorite(model.id );
      favoriteList.removeWhere((element) => element.id == model.id);
      emit(RemoveProductToFavoritesSuccess(favorite: favoriteList));
    } else {
      favoriteList.add(model);
      await HiveServices.addproductToFavorite(product: model);
      emit(AddProductToFavoritesSuccess());
    }
  }

  void getFavorite() async {
    List<FavoriteModel> savedList = await HiveServices.getProductFromFavorite();
    favoriteList = savedList;
    emit(FavoritesLoaded(favorite: favoriteList));
  }

  Future<void> deleteItem(FavoriteModel model) async {
    await HiveServices.deleteProductFromFavorite(model.id );
    favoriteList.removeWhere((elment) => elment.id == model.id);
    emit(RemoveProductToFavoritesSuccess(favorite: favoriteList));
  }

  Future<void> clearAllProduct() async {
    await HiveServices.clearAllFavorite();
    favoriteList.clear();
    emit(ClearFavorites(favorite: favoriteList));
  }


}
