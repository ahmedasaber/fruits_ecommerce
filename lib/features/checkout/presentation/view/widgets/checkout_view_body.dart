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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> autoValidateModeNotifier = ValueNotifier(AutovalidateMode.disabled);
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
    autoValidateModeNotifier.dispose();
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
          Expanded(child: CheckoutStepsPageView(formKey:_formKey,pageController: pageController, valueListenable: autoValidateModeNotifier,)),
          SizedBox(height: 16,),
          CustomButton(
            text: getNextBtText(currentPage),
            onPressed: (){
              if (currentPage == 0) {
                _handeShippingSection(context);
              }else if(currentPage == 1){
                _handeAddressSection(context);
              }
            }
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }

  void _handeShippingSection(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(currentPage+1,duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    }else{
      showErrorBar(context, 'يرجى تحديد طريقه الدفع', backgroundColor: Colors.red, durationInSec: 1);
    }
  }

  void  _handeAddressSection(BuildContext context) {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      pageController.animateToPage(currentPage+1,duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
    }else{
      autoValidateModeNotifier.value = AutovalidateMode.always;
    }
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