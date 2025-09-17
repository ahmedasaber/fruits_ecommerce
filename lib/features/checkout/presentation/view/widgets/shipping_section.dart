import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/checkout/presentation/view/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 33),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: '40',
          onTap: () {
            selected = 0;
            setState(() {});
          },
          isSelected: selected == 0,
        ),
        SizedBox(height: 16),
        ShippingItem(
          title: 'الدفع اونلاين',
          subTitle: 'يرجي تحديد طريقه الدفع',
          price: '40',
          onTap: () {
            selected = 1;
            setState(() {});
          },
          isSelected: selected == 1,
        ),
      ],
    );
  }
}
