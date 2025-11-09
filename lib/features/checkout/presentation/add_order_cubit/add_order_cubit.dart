import 'package:bloc/bloc.dart';
import 'package:fruits_ecommerce/core/repos/order_repo/order_repo.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());

  final OrdersRepo ordersRepo;

  void addOrder(OrderInputEntity orderEntity) async {
    emit(AddOrderLoading());
    var result = await ordersRepo.addOrder(orderEntity: orderEntity);
    result.fold(
      (failure) => emit(AddOrderFailure(errMessage: failure.message)),
      (success) => emit(AddOrderSuccess(orderEntity: orderEntity)),
    );
  }
}
