import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/address_input.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/payment.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController, required this.formKey, required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
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
      AddressInput(formKey: formKey, valueListenable: valueListenable,),
      Payment(pageController: pageController,),
    ];
  }
}