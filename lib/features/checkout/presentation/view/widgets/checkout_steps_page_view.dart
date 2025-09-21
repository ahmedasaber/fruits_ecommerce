import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/address_input.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/payment.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (context, i){
          return getPages()[i];
        }
    );
  }

  List<Widget> getPages(){
    return [
      ShippingSection(),
      AddressInput(),
      Payment(),
    ];
  }
}