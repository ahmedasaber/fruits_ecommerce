import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0
          ),
        ]
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'ابحث عن.......',
          hintStyle: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8,),
              SizedBox(height:24,width:24,child: SvgPicture.asset('assets/images/search-normal.svg')),
              SizedBox(width: 16,)
            ],
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0,),
            child: SvgPicture.asset('assets/images/search-filter.svg'),
          ),
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder:  buildBorder(),
          focusedBorder:  buildBorder(),
        ),
      ),
    );
  }
}

OutlineInputBorder buildBorder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
        color: Colors.white,
        width: 1
    ),
  );
}