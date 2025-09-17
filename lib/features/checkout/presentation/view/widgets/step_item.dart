import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/active_step_item.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.index,
    required this.label,
    required this.isActive,
  });

  final int index;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(label: label, index: index),
      secondChild: ActiveStepItem(label: label),
      crossFadeState: isActive? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}
