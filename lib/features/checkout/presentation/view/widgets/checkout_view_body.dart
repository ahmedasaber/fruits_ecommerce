import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
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
    pageController.addListener((){
      currentPage = pageController.page!.toInt();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          SizedBox(height: 16,),
          CheckoutSteps(currentPage: currentPage, pageController: pageController,),
          SizedBox(height: 16,),
          Expanded(child: CheckoutStepsPageView(pageController: pageController)),
          SizedBox(height: 16,),
          CustomButton(
            text: getNextBtText(currentPage),
            onPressed: (){
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(currentPage+1,duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
                if(currentPage==2){
                  // todo navigation to
                  //Navigator.pushNamed(context, MainView.routeName);
                }
              }else{
                showErrorBar(context, 'يرجى تحديد طريقه الدفع', backgroundColor: Colors.red, durationInSec: 1);
              }
            }
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }

  String getNextBtText(int currPage) {
    switch(currPage){
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عن طريق paypal';
      default:
        return 'التالي';
    }
  }
}