import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/helper_function/get_user_data.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/shipping_address_entity.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/checkout_view_body.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkout';
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context: context, title: 'الشحن', showNotificationBt: false),
      body: Provider.value(
        value: OrderEntity(cartEntity: cartEntity, shippingAddressEntity: ShippingAddressEntity(), uID: getUser().uId),
        child: const CheckoutViewBody()
      )
    );
  }
}
