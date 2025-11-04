import 'package:fruits_ecommerce/core/helper_function/get_currency.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/payment%20entity/details_entity.dart';

class AmountEntity {
  final String total;
  final String currency;
  final DetailsEntity details;

  AmountEntity({
    required this.total,
    required this.currency,
    required this.details,
  });

  factory AmountEntity.fromEntity(OrderInputEntity entity) {
    return AmountEntity(
      total: entity.calcTotalPriceAfterShippingAndDiscount().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(entity),
    );
  }

  Map<String, dynamic> toJson() {
    return {'total': total, 'currency': currency, 'details': details.toJson()};
  }
}
