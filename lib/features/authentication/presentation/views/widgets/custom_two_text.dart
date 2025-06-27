import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class CustomTwoText extends StatefulWidget{
  const CustomTwoText({super.key, required this.text1, required this.text2, required this.onTap});

  final String text1;
  final String text2;
  final VoidCallback onTap;
  @override
  State<CustomTwoText> createState() => _CustomTwoTextState();
}

class _CustomTwoTextState extends State<CustomTwoText> {

  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = widget.onTap;
    super.initState();
  }
  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyles.semiBold16.copyWith(height: 1),
        children: [
          TextSpan(
              text: widget.text1,
              style: TextStyle(color: Color(0xff949d9e),)
          ),
          TextSpan(text: ' '),
          TextSpan(
            text: widget.text2,
            style: TextStyle(color: AppColors.primaryColor,),
            recognizer: _tapGestureRecognizer,
          ),
        ]
      )
    );
  }
}