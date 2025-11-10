import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/core/models/product_model.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo.dart';
import 'package:fruits_ecommerce/core/services/database_service.dart';
import 'package:fruits_ecommerce/core/utils/backend_endpoints.dart';

class ProductsRepoImpl extends ProductsRepo{
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});
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
      return right(products);
    } catch (e){
      log(' best $e');
      return left(ServerFailure('Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async{
   try {
     var data = await databaseService.getData(path: BackEndEndPoints.getProducts) as List<Map<String, dynamic>>;
     List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
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
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products $e'));
    }
  }


}