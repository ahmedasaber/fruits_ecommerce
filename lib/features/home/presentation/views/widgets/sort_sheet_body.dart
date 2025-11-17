import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class SortSheet extends StatefulWidget {
  const SortSheet({super.key});

  @override
  State<SortSheet> createState() => _SortSheetState();
}

class _SortSheetState extends State<SortSheet> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
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
              child: Text(localization.sortBy, style: TextStyles.bold19,),
            ),
            RadioListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                localization.priceLowToHigh,
                style: TextStyles.bold13,
              ),
              value: _selectedOption,
              groupValue: localization.priceLowToHigh,
              onChanged: (value){
                _selectedOption = localization.priceLowToHigh;
                setState(() {});
              },
            ),
            RadioListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                localization.priceHighToLow,
                style: TextStyles.bold13,
              ),
              value: _selectedOption,
              groupValue: localization.priceHighToLow,
              onChanged: (value){
                _selectedOption = localization.priceHighToLow;
                setState(() {});
              },
            ),
            RadioListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              title: Text(
                localization.alphabetical,
                style: TextStyles.bold13,
              ),
              value: _selectedOption,
              groupValue: localization.alphabetical,
              onChanged: (value){
                _selectedOption = localization.alphabetical;
                setState(() {});
              },
            ),
            SizedBox(height: 8,),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .93,
                child: CustomButton(text: localization.filter, onPressed: (){
                  String? sortBy;
                  if(_selectedOption == localization.alphabetical){
                    sortBy = kSortName;
                  }else if(_selectedOption == localization.priceHighToLow){
                    sortBy = kSortHighPrice;
                  }else if(_selectedOption == localization.priceLowToHigh){
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