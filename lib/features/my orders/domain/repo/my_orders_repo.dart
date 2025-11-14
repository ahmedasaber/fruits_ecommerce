 import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/core/services/database_service.dart';
import 'package:fruits_ecommerce/core/utils/backend_endpoints.dart';
import 'package:fruits_ecommerce/features/checkout/data/models/order_model.dart';
import 'package:fruits_ecommerce/features/my%20orders/data/repo/my_orders_repo_impl.dart';
import 'package:fruits_ecommerce/features/my%20orders/domain/entities/my_order_entity.dart';

class MyOrdersRepoImpl extends MyOrdersRepo{
  final DatabaseService databaseService;

  MyOrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<MyOrderEntity>>> getMyOrders({required String userId}) async{
   try {
     List<Map<String, dynamic>> data = await databaseService.getData(path: BackEndEndPoints.myOrders, searchQuery: userId);
     List<MyOrderEntity> orders = data.map((e)=> OrderModel.fromJson(e).toEntity()).toList();
     return right(orders);
   }  catch (e) {
     return left(ServerFailure('Failed to fetch my orders -> $e'));
   }
  }

 }
