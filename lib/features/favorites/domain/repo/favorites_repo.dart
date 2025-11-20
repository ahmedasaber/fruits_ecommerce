
abstract class FavoritesRepo{
  Future<List<String>> getFavProducts();
  Future<void> toggleFavProduct({required String productID});
}