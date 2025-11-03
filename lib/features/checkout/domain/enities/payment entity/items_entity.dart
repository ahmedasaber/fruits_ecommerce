import 'package:fruits_ecommerce/core/helper_function/get_currency.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';

class ItemEntity {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  ItemEntity({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  factory ItemEntity.fromEntity(CartItemEntity entity) {
    return ItemEntity(
      name: entity.productEntity.name,
      quantity: entity.quantity,
      price: entity.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}
