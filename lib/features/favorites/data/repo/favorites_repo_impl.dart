import 'package:fruits_ecommerce/features/favorites/data/data_source/data_source.dart';
import 'package:fruits_ecommerce/features/favorites/domain/repo/favorites_repo.dart';

class FavoritesRepoImpl implements FavoritesRepo{
  final DatabaseRemoteSource databaseRemoteSource;

  FavoritesRepoImpl({required this.databaseRemoteSource});
  @override
  Future<List<String>> getFavProducts() async{
    List<String> favProductsIDs = await databaseRemoteSource.getFavData();
    return favProductsIDs;
  }

  @override
  Future<void> toggleFavProduct({required String productID}) async{
   await databaseRemoteSource.toggleFavData(productId: productID);
  }

}