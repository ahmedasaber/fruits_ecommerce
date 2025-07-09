import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/widget/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        mainAxisExtent: 214
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return const FruitItem();
      },

    );
  }
}
