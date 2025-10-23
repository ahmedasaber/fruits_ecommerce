import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';

class CartEntity{
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity){
    cartItems.add(cartItemEntity);
  }

  bool isExist(ProductEntity productEntity){
    for(var cartItem in cartItems){
      if(cartItem.productEntity.code == productEntity.code) return true;
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity){
    for(var cartItem in cartItems){
      if(cartItem.productEntity.code == productEntity.code) return cartItem;
    }
    return CartItemEntity(productEntity: productEntity, quantity: 1);
  }

  double calculateTotalPrice(){
    double totalPrice = 0.0;
    for (var item in cartItems){
      totalPrice += item.calculateTotalPrice();
    }
    return totalPrice;
  }

  void deleteCartItem(CartItemEntity cartItem){
    cartItems.remove(cartItem);
  }
}