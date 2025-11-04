import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_decorations.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/payment_item.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    var shippingAddress = context.read<OrderInputEntity>().shippingAddressEntity;
    return PaymentItem(
      title: 'عنوان التوصيل :',
      child: Container(
        decoration: AppDecorations.greyDecoration,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/location.svg'),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                '${shippingAddress.address} ${shippingAddress.addressDetails} ${shippingAddress.city}',
                overflow: TextOverflow.ellipsis,
                style: TextStyles.regular16.copyWith(color: Color(0xff4E5556)),
              ),
            ),
            GestureDetector(
              onTap: () {
                pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.bounceIn);
              },
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
