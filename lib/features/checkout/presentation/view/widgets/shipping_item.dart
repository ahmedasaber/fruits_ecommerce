import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({super.key, required this.title, required this.subTitle, required this.price, required this.isSelected, required this.onTap});

  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: const EdgeInsets.only(top: 16,left: 13, right: 9, bottom: 16,),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected? AppColors.primaryColor : Colors.transparent
            ),
            borderRadius: BorderRadius.circular(4)
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: ShapeDecoration(
                  color: isSelected? Colors.white : Colors.transparent,
                  shape: OvalBorder(
                    side: BorderSide(
                      width: isSelected? 0 : 1,
                      color: isSelected? Colors.transparent:Color(0xFF949D9E),
                    ),
                  ) ,
                ),
                child: isSelected? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(backgroundColor: AppColors.primaryColor,),
                ) : SizedBox(),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyles.semiBold13,),
                    Text(subTitle, style: TextStyles.regular13.copyWith(color: Color(0x80000000)),),
                  ],
                ),
              ),
              Center(child: Text('${double.parse(price).toStringAsFixed(2)} جنيه', style: TextStyles.bold13.copyWith(color: Color(0xff3A8B33)),)),
            ],
          ),
        ),
      ),
    );
  }
}
