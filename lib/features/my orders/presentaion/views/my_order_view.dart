import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/get_user_data.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/my%20orders/data/repo/my_orders_repo_impl.dart';
import 'package:fruits_ecommerce/features/my%20orders/presentaion/cubit/my_orders_cubit.dart';
import 'package:fruits_ecommerce/features/my%20orders/presentaion/views/widgets/my_orders_view_body.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  static const routeName = '/my_orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          context: context, title: 'طلباتي', showNotificationBt: false),
      body: BlocProvider(
        create: (context) => MyOrdersCubit(getIt<MyOrdersRepo>())..loadMyOrders(userID: getUser().uId),
        child: MyOrdersViewBody(),
      ),
    );
  }
}
