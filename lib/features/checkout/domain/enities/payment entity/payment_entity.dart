import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/payment%20entity/amount_entity.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/payment%20entity/items_list_entity.dart';

class PaypalPaymentEntity {
  final AmountEntity amount;
  final String description;
  final ItemsListEntity itemList;

  PaypalPaymentEntity({
    required this.amount,
    required this.description,
    required this.itemList,
  });

  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) {
    return PaypalPaymentEntity(
      amount: AmountEntity.fromEntity(entity),
      description: 'The payment transaction description.',
      itemList: ItemsListEntity.fromEntity(entity.cartEntity.cartItems),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount.toJson(),
      'description': description,
      'item_list': itemList.toJson(),
    };
  }
}
