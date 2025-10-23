import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';

abstract class OrdersRepo{
  Future<Either<Failure, void>> addOrder ({required OrderEntity orderEntity});
}