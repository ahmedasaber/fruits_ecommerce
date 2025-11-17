import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderId, required this.count, required this.totalPrice, required this.date});

  final String orderId;
  final String count;
  final String date;
  final String totalPrice;
  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(start: 12),
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: const Color(0xFFEFFAF0),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset('assets/images/order-box.svg'),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + order number
                Text(localization.orderNumberHash(orderId), style: TextStyles.bold13),

                const SizedBox(height: 6),

                // Date
                Text(
                  localization.orderDate(date),
                  style: TextStyles.regular11.copyWith(color: AppColors.hintTextColor),
                ),

                const SizedBox(height: 12),

                // Bottom row: count and price
                Row(
                  children: [
                    Text(
                      localization.ordersCount,
                      style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),
                    ),
                    SizedBox(width: 6),
                    Text(count, style: TextStyles.bold13),
                    SizedBox(width: 18),
                    Text(localization.priceInEGP(totalPrice), style: TextStyles.bold13),
                    SizedBox(width: 18),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
