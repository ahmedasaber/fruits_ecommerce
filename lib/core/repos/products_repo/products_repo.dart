import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';

abstract class ProductsRepo{
  Future<Either<Failure,List<ProductEntity>>> getProducts();
  Future<Either<Failure,List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure,List<ProductEntity>>> getSearchedProducts({required String query});
  Future<Either<Failure,List<ProductEntity>>> getFilteredProducts({required String query});
}