import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/fruit_details/presentation/view/widgets/fruit_details_view_body.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class FruitDetailsHeader extends StatelessWidget {
  const FruitDetailsHeader({
    super.key,
    required this.widget,
  });

  final FruitDetailsViewBody widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.productEntity.name,
          style: TextStyles.semiBold13,
        ),
        const SizedBox(height: 7),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '£${widget.productEntity.price} ',
                style:
                TextStyles.bold13.copyWith(color: AppColors.secondaryColor),
              ),
              TextSpan(
                text: S.of(context).perKilo,
                style: TextStyles.bold13.copyWith(color: AppColors.lightSecondaryColor),
              ),
            ],
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
