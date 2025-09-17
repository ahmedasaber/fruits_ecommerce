import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(getSteps.length, (i) {
        return Expanded(
          child: StepItem(index: i + 1, label: getSteps[i], isActive: true),
        );
      }),
    );
  }
}

List<String> get getSteps => ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];