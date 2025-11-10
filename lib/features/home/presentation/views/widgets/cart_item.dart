import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart%20item/cart_item_cubit.dart';
import 'package:fruits_ecommerce/features/home/presentation/cubit/cart/cart_cubit.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/circular_icon_bt.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, curr){
        if(curr is CartItemUpdated){
          if(curr.cartItemEntity == cartItemEntity){
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        return Column(
          children: [
            Divider(color: Color(0xffF1F1F5), height:10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 73,
                    height: 93,
                    decoration: BoxDecoration(color: AppColors.lightGreyColor),
                    child: Image.network(cartItemEntity.productEntity.imageUrl!),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(cartItemEntity.productEntity.name, style: TextStyles.bold13,),
                            InkWell(
                              onTap: (){
                                context.read<CartCubit>().deleteCartItem(cartItemEntity);
                              },
                              child: SvgPicture.asset('assets/images/trash.svg')
                            ),
                          ],
                        ),
                        SizedBox(height: 2,),
                        Text('${cartItemEntity.calculateTotalAmount()} كم', style: TextStyles.regular13.copyWith(color: AppColors.secondaryColor),),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            Transform.translate(
                              offset: Offset(4, 0),
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CircularIconBt(onPressed: (){
                                      cartItemEntity.increaseCount();
                                      context.read<CartItemCubit>().updateCartItem(cartItemEntity);
                                    }, icon: Icon(Icons.add), iconColor: Colors.white,)
                                  ),
                                  SizedBox(width: 16,),
                                  Text('${cartItemEntity.quantity}', style: TextStyles.bold16,),
                                  SizedBox(width: 16,),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CircularIconBt(onPressed: (){
                                      cartItemEntity.decreaseCount();
                                      context.read<CartItemCubit>().updateCartItem(cartItemEntity);
                                    }, icon: Icon(Icons.remove), iconColor: Colors.black, backgroundColor: AppColors.lightGreyColor,),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text('${cartItemEntity.calculateTotalPrice().toStringAsFixed(2)} جنيه ', style: TextStyles.bold16.copyWith(color: AppColors.secondaryColor),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
