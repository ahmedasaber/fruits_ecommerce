import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/checkout_steps.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 16,),
          CheckoutSteps(pageController: pageController),
          SizedBox(height: 16,),
          Expanded(child: CheckoutStepsPageView(pageController: pageController)),
          SizedBox(height: 16,),
          CustomButton(
            text: 'التالي',
            onPressed: (){
              pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
            }
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}