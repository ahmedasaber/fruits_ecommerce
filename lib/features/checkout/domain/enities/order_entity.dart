import 'package:fruits_ecommerce/features/checkout/domain/enities/shipping_address_entity.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/cart_entity.dart';

class OrderInputEntity{
  final String uID;
  final String orderId;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;
  OrderInputEntity({this.payWithCash, required this.orderId, required this.shippingAddressEntity, required this.cartEntity, required this.uID,});

  double calcShippingCost(){
    return payWithCash!? 0 : 40;
  }
  double calcShippingDiscount(){
    return 0;
  }
  double calcTotalPriceAfterShippingAndDiscount(){
    return cartEntity.calculateTotalPrice() + calcShippingCost() - calcShippingDiscount();
  }
}