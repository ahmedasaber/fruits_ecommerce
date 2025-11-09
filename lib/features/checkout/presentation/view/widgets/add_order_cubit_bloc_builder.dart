import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_progress_hud.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/main_view.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/payment_success.dart';
import '../../add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (BuildContext context, AddOrderState state) {
        if(state is AddOrderFailure){
          showErrorBar(context, state.errMessage, backgroundColor: Colors.red);
          Navigator.pop(context);
        }else if(state is AddOrderSuccess){
          showErrorBar(context, 'تمت العمليه بنجاح', backgroundColor: Colors.green);
          Navigator.pushNamedAndRemoveUntil(context, MainView.routeName, (r)=> false);
          Navigator.pushNamed(context, PaymentSuccessPage.routeName,arguments: state.orderEntity.orderId);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(isLoading: state is AddOrderLoading, child: child,);
      },
    );
  }
}
