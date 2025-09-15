import 'package:flutter/cupertino.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});

  final List<CartItemEntity> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return CartItem(cartItemEntity: cartItems[index],);
      }
    );
  }
}
