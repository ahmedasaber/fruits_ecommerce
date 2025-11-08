import 'package:dartz/dartz.dart';
import 'package:fruits_ecommerce/core/errors/failures.dart';
import 'package:fruits_ecommerce/core/repos/order_repo/order_repo.dart';
import 'package:fruits_ecommerce/core/services/database_service.dart';
import 'package:fruits_ecommerce/core/utils/backend_endpoints.dart';
import 'package:fruits_ecommerce/features/checkout/data/models/order_model.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';

class OrdersRepoImpl extends OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, void>> addOrder({required OrderInputEntity orderEntity}) async{
    try {
      OrderModel orderModel = OrderModel.fromEntity(orderEntity);
      await databaseService.addData(path: BackEndEndPoints.addOrder, docId: orderModel.orderId,data: orderModel.toJson());
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
