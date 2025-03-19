part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class ProductDetailsInitial extends FavoritesState {}

final class AddProductToFavoritesSuccess extends FavoritesState {}

final class RemoveProductToFavoritesSuccess extends FavoritesState {
  final List<FavoriteModel> favorite;

  RemoveProductToFavoritesSuccess({required this.favorite});
}

final class FavoritesLoaded extends FavoritesState {
  final List<FavoriteModel> favorite;

  FavoritesLoaded({required this.favorite});
}

final class ClearFavorites extends FavoritesState {
  final List<FavoriteModel> favorite;

  ClearFavorites({required this.favorite});
}
