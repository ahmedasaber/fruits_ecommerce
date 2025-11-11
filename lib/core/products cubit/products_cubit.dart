import 'package:bloc/bloc.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;

  int productsLength = 0;
  Future<void> loadProducts() async{
    var result =  await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products: products));
      },
    );
  }

  Future<void> loadBestSellingProducts() async{
    var result =  await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> loadSearchedProducts({required String query}) async{
    if (query.isNotEmpty) {
      emit(ProductsLoading());
      var result =  await productsRepo.getSearchedProducts(query: query);
      result.fold(
        (failure) => emit(ProductsFailure(errMessage: failure.message)),
        (products) => emit(ProductsSuccess(products: products)),
      );
    }else{
      emit(ProductsInitial());
    }
  }
  Future<void> loadFilteredProducts({required String? query}) async{
    if (query != null && query.isNotEmpty) {
      emit(ProductsLoading());
      var result =  await productsRepo.getFilteredProducts(query: query);
      result.fold(
        (failure) => emit(ProductsFailure(errMessage: failure.message)),
        (products) => emit(ProductsSuccess(products: products)),
      );
    }
  }
}
