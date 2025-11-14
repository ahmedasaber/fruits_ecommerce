import 'package:fruits_ecommerce/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_ecommerce/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/my%20orders/domain/entities/my_order_entity.dart';

class OrderModel {
  final String orderId;
  final double totalPrice;
  final String uld;
  final String status;
  final String date;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.orderId,
    required this.totalPrice,
    required this.uld,
    required this.status,
    required this.date,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uld: json['uld'],
      orderId: json['orderId'],
      status: json['status'] ?? 'pending',
      date: json['date'].toString(),
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddressModel'],
      ),
      orderProducts: List.of(json['orderProducts']).map((e) => OrderProductModel.fromJson(e)).toList(),
      paymentMethod: json['paymentMethod'],
    );
  }

  factory OrderModel.fromEntity(OrderInputEntity entity){
    return OrderModel(
        orderId: entity.orderId,
        totalPrice: entity.cartEntity.calculateTotalPrice(),
        uld: entity.uID,
        status: 'pending',
        date: entity.date,
        shippingAddressModel: ShippingAddressModel.fromEntity(entity.shippingAddressEntity),
        orderProducts: entity.cartEntity.cartItems.map((e)=>OrderProductModel.fromEntity(e)).toList(),
        paymentMethod: entity.payWithCash!? 'cash' : 'online',
    );
  }

  MyOrderEntity toEntity() {
    return MyOrderEntity(
      totalPrice: totalPrice,
      uld: uld,
      orderId: orderId,
      date: date,
      status: status,
      shippingAddressEntity: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((e)=>e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }

  toJson() {
    return {
      'orderId': orderId,
      'totalPrice': totalPrice,
      'uld': uld,
      'status': 'pending',
      'date': date,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((entity) => entity.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
