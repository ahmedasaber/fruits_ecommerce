import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/core/models/product_model.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo.dart';
import 'package:fruits_ecommerce/core/services/database_service.dart';
import 'package:fruits_ecommerce/core/utils/backend_endpoints.dart';
import 'package:fruits_ecommerce/features/favorites/data/data_source/data_source.dart';

class ProductsRepoImpl extends ProductsRepo{
  final DatabaseService databaseService;
  final DatabaseRemoteSource databaseRemoteSource;
  ProductsRepoImpl( {required this.databaseService, required this.databaseRemoteSource,});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async{
    try {
      var data = await databaseService.getData(
          path: BackEndEndPoints.getProducts,
          query: {
            'orderBy': 'sellingCount',
            'descending': true,
            'limit': 8,
          }
      ) as List<Map<String, dynamic>>;
      List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();

      List<String> favProductsData = await databaseRemoteSource.getFavData();
      for(var product in products){
        product.isFav = favProductsData.contains(product.code);
      }
      return right(products);
    } catch (e){
      log(' best $e');
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
   try {
     var productsData = await databaseService.getData(path: BackEndEndPoints.getProducts) as List<Map<String, dynamic>>;
     List<ProductModel> products = productsData.map((e) => ProductModel.fromJson(e)).toList();

     List<String> favProductsData = await databaseRemoteSource.getFavData();
     for(var product in products){
       product.isFav = favProductsData.contains(product.code);
     }
     return right(products);
   } catch (e){
     log('all $e');
    return left(ServerFailure('Failed to get products'));
   }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSearchedProducts({required String query}) async{
    try {
      List<Map<String, dynamic>> data = await databaseService.getData(
        path: BackEndEndPoints.getProducts,
        searchQuery: query,
        query: {
          'orderBy': 'name'
        });
      List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();

      List<String> favProductsData = await databaseRemoteSource.getFavData();
      for(var product in products){
        product.isFav = favProductsData.contains(product.code);
      }
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFilteredProducts({required String query}) async{
    try {
      final sortBy = filterQuery(query);
      List<Map<String, dynamic>> data = await databaseService.getData(
        path: BackEndEndPoints.getProducts,
        query: sortBy
      );
      List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();

      List<String> favProductsData = await databaseRemoteSource.getFavData();
      for(var product in products){
        product.isFav = favProductsData.contains(product.code);
      }
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products $e'));
    }
  }

  Map<String, dynamic> filterQuery(String query){
    if (query == kSortName) {
      return {
        'orderBy': 'name',
        'descending': false,
      };
    } else if (query == kSortLowPrice) {
      return {
        'orderBy': 'price',
        'descending': false,
      };
    } else if (query == kSortHighPrice) {
      return {
        'orderBy': 'price',
        'descending': true,
      };
    }
    return {'orderBy': 'name',};
  }
}