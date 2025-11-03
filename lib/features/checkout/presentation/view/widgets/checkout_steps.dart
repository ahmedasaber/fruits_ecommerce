import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPage, required this.pageController, required this.onTap});

  final int currentPage;
  final PageController pageController;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(getSteps.length, (i) {
        return Expanded(
          child: GestureDetector(
            onTap: (){onTap(i);},
              child: StepItem(index: i + 1, label: getSteps[i], isActive: i <= currentPage)
          ),
        );
      }),
    );
  }
}

List<String> get getSteps => ['الشحن', 'العنوان', 'الدفع'];