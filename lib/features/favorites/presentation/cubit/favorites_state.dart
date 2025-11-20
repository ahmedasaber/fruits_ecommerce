part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesLoading extends FavoritesState {}
final class FavoritesSuccess extends FavoritesState {
  final List<ProductEntity> favProducts;

  FavoritesSuccess({required this.favProducts});
}
final class FavoritesFailure extends FavoritesState {
  final String errMessage;

  FavoritesFailure({required this.errMessage});
}
final class FavoritesToggle extends FavoritesState {}
