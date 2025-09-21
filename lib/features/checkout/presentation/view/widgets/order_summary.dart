import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/payment_item.dart';

import '../../../../../core/utils/app_text_style.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const PaymentItem(
      title: 'ملخص الطلب :',
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('المجموع الفرعي :',style: TextStyles.regular13,),
                Spacer(),
                Text('150 جنيه',style: TextStyles.semiBold16,),
              ],
            ),
            Row(
              children: [
                Text('التوصيل  :',style: TextStyles.regular13,),
                Spacer(),
                Text('30 جنيه',style: TextStyles.semiBold13,),
                SizedBox(width: 20,)
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Divider(
                height: 18,
                thickness: .5,
                color: Color(0xffCACECE),
              ),
            ),
            Row(
              children: [
                Text('الكلي',style: TextStyles.bold16,),
                Spacer(),
                Text('180 جنيه',style: TextStyles.bold16,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
