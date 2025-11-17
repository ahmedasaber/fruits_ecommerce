import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/step_item.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPage, required this.pageController, required this.onTap});

  final int currentPage;
  final PageController pageController;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    List<String> steps = getSteps(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(steps.length, (i) {
        return Expanded(
          child: GestureDetector(
            onTap: (){onTap(i);},
              child: StepItem(index: i + 1, label: steps[i], isActive: i <= currentPage)
          ),
        );
      }),
    );
  }
}

List<String> getSteps(BuildContext context) => [S.of(context).shipping, S.of(context).address, S.of(context).payment];