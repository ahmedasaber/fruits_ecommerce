import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/features/my%20orders/domain/entities/my_order_entity.dart';

abstract class MyOrdersRepo{
  Future<Either<Failure, List<MyOrderEntity>>> getMyOrders({required String userId});
}