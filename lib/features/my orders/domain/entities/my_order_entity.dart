import 'package:fruits_ecommerce/features/checkout/domain/enities/shipping_address_entity.dart';
import 'package:fruits_ecommerce/features/my%20orders/domain/entities/order_product_entity.dart';

class MyOrderEntity {
  final double totalPrice;
  final String uld;
  final String date;
  final String orderId;
  final String status;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;

  MyOrderEntity({
    required this.totalPrice,
    required this.uld,
    required this.date,
    required this.orderId,
    required this.status,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
  });
}
