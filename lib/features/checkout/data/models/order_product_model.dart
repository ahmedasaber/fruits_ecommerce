import 'package:fruits_ecommerce/features/home/domain/entites/cart_item_entity.dart';
import 'package:fruits_ecommerce/features/my%20orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel(
      {required this.name, required this.code, required this.imageUrl, required this.price, required this.quantity});

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  factory OrderProductModel.fromEntity(CartItemEntity entity){
    return OrderProductModel(
      name: entity.productEntity.name,
      code: entity.productEntity.code,
      imageUrl: entity.productEntity.imageUrl!,
      price: entity.productEntity.price.toDouble(),
      quantity: entity.quantity,
    );
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      code: code,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity,
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