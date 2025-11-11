import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';

class SortSheet extends StatefulWidget {
  const SortSheet({super.key});

  @override
  State<SortSheet> createState() => _SortSheetState();
}

class _SortSheetState extends State<SortSheet> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .387,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Center(
              child: Divider(
                thickness: 3,
                indent: 145,
                endIndent: 145,
                color: Color(0xff131F46),
                radius: BorderRadius.circular(25),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
              child: Text('ترتيب حسب :', style: TextStyles.bold19,),
            ),
            RadioListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                'السعر ( الأقل الي الأعلي )',
                style: TextStyles.bold13,
              ),
              value: _selectedOption,
              groupValue: 'السعر ( الأقل الي الأعلي )',
              onChanged: (value){
                _selectedOption = 'السعر ( الأقل الي الأعلي )';
                setState(() {});
              },
            ),
            RadioListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                'السعر ( الأعلي الي الأقل )',
                style: TextStyles.bold13,
              ),
              value: _selectedOption,
              groupValue: 'السعر ( الأعلي الي الأقل )',
              onChanged: (value){
                _selectedOption = 'السعر ( الأعلي الي الأقل )';
                setState(() {});
              },
            ),
            RadioListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                'الأبجديه',
                style: TextStyles.bold13,
              ),
              value: _selectedOption,
              groupValue: 'الأبجديه',
              onChanged: (value){
                _selectedOption = 'الأبجديه';
                setState(() {});
              },
            ),
            SizedBox(height: 8,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .93,
                child: CustomButton(text: 'تصفيه', onPressed: (){
                  String? sortBy;
                  if(_selectedOption == 'الأبجديه'){
                    sortBy = kSortName;
                  }else if(_selectedOption == 'السعر ( الأعلي الي الأقل )'){
                    sortBy = kSortHighPrice;
                  }else if(_selectedOption == 'السعر ( الأقل الي الأعلي )'){
                    sortBy = kSortLowPrice;
                  }
                  if(sortBy != null) Navigator.pop(context, sortBy);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}