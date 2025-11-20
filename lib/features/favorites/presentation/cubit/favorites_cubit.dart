import 'package:bloc/bloc.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/models/product_model.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo.dart';
import 'package:fruits_ecommerce/features/favorites/domain/repo/favorites_repo.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.productsRepo, this.favoritesRepo) : super(FavoritesInitial());

  final ProductsRepo productsRepo;
  final FavoritesRepo favoritesRepo;

  void getFavProducts() async{
    emit(FavoritesLoading());
    var result =  await productsRepo.getProducts();
    result.fold((failure) => emit(FavoritesFailure(errMessage: failure.message)),
      (products) {
        List<ProductEntity> favProducts = products.where((product)=> product.isFav).toList();
        emit(FavoritesSuccess(favProducts: favProducts));
      });
  }

  void toggleFavProduct(ProductModel product) async{
    await favoritesRepo.toggleFavProduct(productID: product.code);
    if(state is FavoritesSuccess){
      final currentFavs = (state as FavoritesSuccess).favProducts;
      //List<ProductEntity> updatedFavs = Set.from(currentFavs);

      // Check if product exists in favorites
      final isExist = currentFavs.contains(product);
      List<ProductEntity> updatedFavs = List.from(currentFavs);
      if (isExist) {
        // Product is currently favorited, remove it
        updatedFavs.remove(product);
        product.isFav = false;
      } else {
        // Product is not favorited, add it
        product.isFav = true;
        updatedFavs.add(product);
      }

      emit(FavoritesSuccess(favProducts: updatedFavs));
    }else{
      getFavProducts();
    }
  }
}
