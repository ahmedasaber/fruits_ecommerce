import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/features/checkout/domain/enities/order_entity.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    int shippingValue = 40;
    var orderEntity = context.read<OrderInputEntity>();
    var totalPrice = orderEntity.cartEntity.calculateTotalPrice();
    return Column(
      children: [
        SizedBox(height: 33),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: (totalPrice + shippingValue).toString(),
          onTap: () {
            selected = 0;
            orderEntity.payWithCash = true;
            setState(() {});
          },
          isSelected: selected == 0,
        ),
        SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price:(totalPrice).toString(),
          onTap: () {
            selected = 1;
            orderEntity.payWithCash = false;
            setState(() {});
          },
          isSelected: selected == 1,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
