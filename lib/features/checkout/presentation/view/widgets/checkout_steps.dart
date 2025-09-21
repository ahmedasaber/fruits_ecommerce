import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPage, required this.pageController});

  final int currentPage;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(getSteps.length, (i) {
        return Expanded(
          child: GestureDetector(
            onTap: (){
              pageController.animateToPage(i, duration: Duration(milliseconds: 300), curve:Curves.bounceIn);
            },
              child: StepItem(index: i + 1, label: getSteps[i], isActive: i <= currentPage)
          ),
        );
      }),
    );
  }
}

List<String> get getSteps => ['الشحن', 'العنوان', 'الدفع'];