abstract class DatabaseRemoteSource {
  Future<List<String>> getFavData();
  Future<void> toggleFavData({required String productId});
}