import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';

class DetailsEntity {
  final String subtotal;
  final String shipping;
  final double shippingDiscount;

  DetailsEntity({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  factory DetailsEntity.fromEntity(OrderEntity entity) {
    return DetailsEntity(
      subtotal: entity.cartEntity.calculateTotalPrice().toString(),
      shipping: entity.calcShippingCost().toString(),
      shippingDiscount: entity.calcShippingDiscount(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
