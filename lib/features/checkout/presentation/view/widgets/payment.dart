import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/delivery_address.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/order_summary.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24,),
        OrderSummary(),
        SizedBox(height: 16,),
        DeliveryAddress(),
      ],
    );
  }
}