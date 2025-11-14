import 'package:bloc/bloc.dart';
import 'package:fruits_ecommerce/features/my%20orders/data/repo/my_orders_repo_impl.dart';
import 'package:fruits_ecommerce/features/my%20orders/domain/entities/my_order_entity.dart';
import 'package:meta/meta.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this.myOrdersRepo) : super(MyOrdersInitial());
  final MyOrdersRepo myOrdersRepo;

  void loadMyOrders({required String userID})async{
    emit(MyOrdersLoading());
    var result = await myOrdersRepo.getMyOrders(userId: userID);
    result.fold(
      (failure) => emit(MyOrdersFailure(errMessage: failure.message)),
      (myOrders) => emit(MyOrdersSuccess(myOrders: myOrders))
    );
  }
}
