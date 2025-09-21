import 'package:fruits_ecommerce/features/checkout/domain/enities/shipping_address_entity.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_entity.dart';

class OrderEntity{
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;
  OrderEntity({this.payWithCash,  required this.shippingAddressEntity, required this.cartEntity});
}