import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/core/widget/custom_text_field.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';

class AddressInput extends StatelessWidget {
  const AddressInput({super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    var orderAddress= context.read<OrderInputEntity>().shippingAddressEntity;
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (value){
                  orderAddress.name = value!;
                },
                hintText: 'الاسم كامل', textInputType: TextInputType.text
              ),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value){
                  orderAddress.email = value!;
                },
                hintText: 'البريد الإلكتروني', textInputType: TextInputType.emailAddress
              ),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value){
                  orderAddress.address = value!;
                },
                hintText: 'العنوان', textInputType: TextInputType.streetAddress
              ),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value){
                  orderAddress.phone = value!;
                },
                hintText: 'رقم الهاتف', textInputType: TextInputType.phone
              ),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value){
                  orderAddress.city = value!;
                },
                hintText: 'المدينه', textInputType: TextInputType.text
              ),
              SizedBox(height: 8,),
              CustomTextFormField(
                onSaved: (value){
                  orderAddress.addressDetails = value!;
                },
                hintText: 'رقم الطابق , رقم الشقه ..', textInputType: TextInputType.streetAddress
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Switch.adaptive(
                        value: false,
                        onChanged: (bool value) {  },
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text('حفظ العنوان', style: TextStyles.semiBold13.copyWith(color: AppColors.hintTextColor,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
