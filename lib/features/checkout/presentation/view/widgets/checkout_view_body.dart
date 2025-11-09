import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/utils/app_keys.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/payment%20entity/payment_entity.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/add_order_cubit/add_order_cubit.dart';
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
          CheckoutSteps(currentPage: currentPage, pageController: pageController, onTap: (int i) {
            if (i == 0) {
              pageController.animateToPage(i, duration: Duration(milliseconds: 300), curve:Curves.bounceIn);
            }else if(i == 1){
              var orderEntity = context.read<OrderInputEntity>();
              if (orderEntity.payWithCash != null) {
                pageController.animateToPage(i, duration: Duration(milliseconds: 300), curve:Curves.bounceIn);
              }else{
                showErrorBar(context, 'يرجى تحديد طريقه الدفع', backgroundColor: Colors.red, durationInSec: 1);
              }
            }else{
              _handeAddressSection(context);
            }
          },),
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
              }else {
                _processPayment(context);
              }
            }
          ),
          SizedBox(height: 16,),
        ],
      ),
    );
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    var addOrderCubit = context.read<AddOrderCubit>();
    if (orderEntity.payWithCash!) {
      addOrderCubit.addOrder(orderEntity);
    }
    else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
          PaypalCheckoutView(
            sandboxMode: true,
            // testing process?
            clientId: kPaypalClientId,
            secretKey: kPaypalSecretKey,
            transactions: [
              PaypalPaymentEntity.fromEntity(orderEntity).toJson(),
            ],
            note: 'Contact us for any questions on your order.',
            onSuccess: (Map params) async {
              addOrderCubit.addOrder(orderEntity);
            },
            onError: (error) {
              showErrorBar(context, 'onError: $error');
              Navigator.pop(context);
            },
            onCancel: () {
              showErrorBar(context, 'cancelled');
            },
          ),
      ));
    }
  }

  void _handeShippingSection(BuildContext context) {
    if (context.read<OrderInputEntity>().payWithCash != null) {
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
        if(context.read<OrderInputEntity>().payWithCash!){
          return 'تأكيد الطلب';
        }else{
          return 'الدفع عن طريق paypal';
        }
      default:
        return 'التالي';
    }
  }
}