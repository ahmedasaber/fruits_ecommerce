import 'package:fruits_ecommerce/core/entities/product_entity.dart';

class CartItemEntity{
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice(){
    return productEntity.price * count;
  }

  num calculateTotalAmount(){
    return productEntity.unitAmount * count;
  }

  increaseCount(){
    count++;
  }

  decreaseCount(){
    if (count > 1) {
      count--;
    }
  }
}