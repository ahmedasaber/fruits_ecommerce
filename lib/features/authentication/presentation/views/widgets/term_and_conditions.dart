import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/features/authentication/presentation/views/widgets/custom_checkedbox.dart';

import '../../../../../core/utils/app_text_style.dart';

class TermsAndConditions extends StatefulWidget{
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();

}
class _TermsAndConditionsState extends State<TermsAndConditions>{
  bool isTermsAccept = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckedBox(
          onChanged: (value){
            isTermsAccept = value;
            widget.onChanged(isTermsAccept);
            setState(() {});
          },
          isChecked: isTermsAccept,
        ),
        SizedBox(width: 16,),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: TextStyles.semiBold13,
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyle(color: Color(0xff949d9e),),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا ',
                  style: TextStyle(color: AppColors.lightPrimaryColor)
                ),
              ]
            )
          ),
        ),
      ],
    );
  }

}