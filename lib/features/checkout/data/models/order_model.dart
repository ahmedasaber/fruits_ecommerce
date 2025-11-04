import 'package:fruits_ecommerce/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_ecommerce/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uld;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uld,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderInputEntity entity){
    return OrderModel(
        totalPrice: entity.cartEntity.calculateTotalPrice(),
        uld: entity.uID,
        shippingAddressModel: ShippingAddressModel.fromEntity(entity.shippingAddressEntity),
        orderProducts: entity.cartEntity.cartItems.map((e)=>OrderProductModel.fromEntity(e)).toList(),
        paymentMethod: entity.payWithCash!? 'cash' : 'online',
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uld': uld,
      'status': 'pending',
      'data': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((entity) => entity.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
