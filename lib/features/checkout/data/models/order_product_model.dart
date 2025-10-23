import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel(
      {required this.name, required this.code, required this.imageUrl, required this.price, required this.quantity});

  factory OrderProductModel.fromEntity(CartItemEntity entity){
    return OrderProductModel(
      name: entity.productEntity.name,
      code: entity.productEntity.code,
      imageUrl: entity.productEntity.imageUrl!,
      price: entity.productEntity.price.toDouble(),
      quantity: entity.quantity,
    );
  }

  toJson(){
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}