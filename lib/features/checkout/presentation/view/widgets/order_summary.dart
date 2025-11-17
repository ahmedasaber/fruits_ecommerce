import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/payment_item.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_text_style.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>().cartEntity;
    var localization = S.of(context);
    return PaymentItem(
      title: localization.orderSummary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(localization.subtotal,style: TextStyles.regular13,),
                const Spacer(),
                Text(localization.priceInEGP(orderEntity.calculateTotalPrice().toStringAsFixed(2)),style: TextStyles.semiBold16,),
              ],
            ),
            Row(
              children: [
                Text(localization.delivery,style: TextStyles.regular13,),
                Spacer(),
                Text(localization.deliveryPrice,style: TextStyles.semiBold13,),
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
                Text(localization.total,style: TextStyles.bold16,),
                Spacer(),
                Text(localization.priceInEGP((orderEntity.calculateTotalPrice() + 40).toStringAsFixed(2)),style: TextStyles.bold16,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
