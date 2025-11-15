import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/widget/custom_button.dart';
import 'package:fruits_ecommerce/features/fruit_details/presentation/view/widgets/fruit_deatails_header.dart';
import 'package:fruits_ecommerce/features/fruit_details/presentation/view/widgets/fruit_image.dart';
import 'package:fruits_ecommerce/features/fruit_details/presentation/view/widgets/reviews_header.dart';
import 'package:fruits_ecommerce/features/fruit_details/presentation/view/widgets/state_card.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart/cart_cubit.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../home/presentation/views/widgets/circular_icon_bt.dart';

class FruitDetailsViewBody extends StatefulWidget {
  const FruitDetailsViewBody({super.key, required this.productEntity});

  final ProductEntity productEntity;


  @override
  State<FruitDetailsViewBody> createState() => _FruitDetailsViewBodyState();
}

class _FruitDetailsViewBodyState extends State<FruitDetailsViewBody> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FruitImage(imageUrl: widget.productEntity.imageUrl!),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: FruitDetailsHeader(widget: widget),
                    ),
                    const SizedBox(width: 12),
                    CircularIconBt(
                      onPressed: () {
                        counter++;
                        setState(() {});
                      },
                      icon: const Icon(Icons.add),
                      iconColor: Colors.white,
                    ),
                    SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(counter.toString()),
                    ),
                    SizedBox(width: 16),
                    CircularIconBt(
                      onPressed: () {
                        counter--;
                        setState(() {});
                      },
                      backgroundColor:  AppColors.lightGreyColor,
                      icon: const Icon(Icons.remove),
                      iconColor: AppColors.greyColor,
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 8),
                    Text(widget.productEntity.avgRating.toString(), style:  TextStyles.semiBold13),
                    const SizedBox(width: 16),
                    Text('(${widget.productEntity.reviews.length}+)', style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor,)),
                    const SizedBox(width: 8),
                    ReviewsHeader(),
                  ],
                ),
                const SizedBox(height: 8,),
                Text(widget.productEntity.description , style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),),
                const SizedBox(height: 16,),
                StateCard(title: '${widget.productEntity.expirationsMonth} شهر', subTitle: 'الصلاحيه', iconPath: 'assets/images/calender.svg',),
                const SizedBox(height: 8,),
                StateCard(title: '100%', subTitle: 'اوجانيك', iconPath: 'assets/images/natural.svg',),
                const SizedBox(height: 8,),
                StateCard(title: '${widget.productEntity.numOfCalories} كالوري', subTitle: '${widget.productEntity.unitAmount} جرام', iconPath: 'assets/images/calo.svg',),
                SizedBox(height: 16,),
                CustomButton(text: 'أضف الي السلة', onPressed: (){
                  context.read<CartCubit>().addProduct(widget.productEntity);
                }),
                SizedBox(height: 24,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}