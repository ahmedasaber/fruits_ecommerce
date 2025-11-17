import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/get_user_data.dart';
import 'package:fruits_ecommerce/core/repos/order_repo/order_repo.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/shipping_address_entity.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/checkout_view_body.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_entity.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderInputEntity orderEntity;
  @override
  void initState() {
    super.initState();
    orderEntity = OrderInputEntity(cartEntity: widget.cartEntity, shippingAddressEntity: ShippingAddressEntity(), uID: getUser().uId, orderId: Uuid().v4());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt<OrdersRepo>()),
      child: Scaffold(
      appBar: buildCustomAppBar(context: context, title: S.of(context).shipping, showNotificationBt: false),
      body: Provider.value(
        value: orderEntity,
        child: AddOrderCubitBlocBuilder(child: const CheckoutViewBody()),
      )
    ),
);
  }
}
