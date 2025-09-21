import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/step_item.dart';
import '../../../domain/enities/order_entity.dart';

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
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(i, duration: Duration(milliseconds: 300), curve:Curves.bounceIn);
              }else{
                showErrorBar(context, 'يرجى تحديد طريقه الدفع', backgroundColor: Colors.red, durationInSec: 1);
              }
            },
              child: StepItem(index: i + 1, label: getSteps[i], isActive: i <= currentPage)
          ),
        );
      }),
    );
  }
}

List<String> get getSteps => ['الشحن', 'العنوان', 'الدفع'];