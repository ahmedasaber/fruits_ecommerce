import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_decorations.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/payment_item.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل :',
      child: Container(
        decoration: AppDecorations.greyDecoration,
        child: Row(
          children: [
            SvgPicture.asset('assets/images/location.svg'),
            SizedBox(width: 8),
            Text(
              'شارع النيل، مبنى رقم ١٢٣',
              style: TextStyles.regular16.copyWith(color: Color(0xff4E5556)),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/edit.svg'),
                  SizedBox(width: 4),
                  Text(
                    'تعديل',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
