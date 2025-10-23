import 'package:fruits_ecommerce/core/entities/product_entity.dart';

class CartItemEntity{
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice(){
    return productEntity.price * quantity;
  }

  num calculateTotalAmount(){
    return productEntity.unitAmount * quantity;
  }

  increaseCount(){
    quantity++;
  }

  decreaseCount(){
    if (quantity > 1) {
      quantity--;
    }
  }
}