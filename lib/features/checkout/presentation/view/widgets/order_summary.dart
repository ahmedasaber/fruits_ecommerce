import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/payment_item.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_text_style.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>().cartEntity;
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('المجموع الفرعي :',style: TextStyles.regular13,),
                const Spacer(),
                Text('${orderEntity.calculateTotalPrice()} جنيه',style: TextStyles.semiBold16,),
              ],
            ),
            const Row(
              children: [
                Text('التوصيل  :',style: TextStyles.regular13,),
                Spacer(),
                Text('40 جنيه',style: TextStyles.semiBold13,),
                SizedBox(width: 20,)
              ],
            ),
            const Padding(
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
                Text('${orderEntity.calculateTotalPrice() + 40} جنيه',style: TextStyles.bold16,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
