import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/features/my%20orders/domain/entities/my_order_entity.dart';
import 'package:fruits_ecommerce/features/my%20orders/presentaion/cubit/my_orders_cubit.dart';
import 'package:fruits_ecommerce/features/my%20orders/presentaion/views/widgets/order%20_card.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersState>(
      builder: (context, state) {
        if (state is MyOrdersSuccess) {
          List<MyOrderEntity> myOrders = state.myOrders;
          return ListView.builder(
            itemCount: myOrders.length,
            itemBuilder: (context, i) {
              return OrderCard(
                orderId: myOrders[i].orderId,
                count: myOrders[i].orderProducts.length.toString(),
                totalPrice: myOrders[i].totalPrice.toStringAsFixed(2),
                date: myOrders[i].date,
              );
            },
          );
        } else if (state is MyOrdersLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is MyOrdersFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
