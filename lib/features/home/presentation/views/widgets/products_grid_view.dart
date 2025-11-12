import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/entities/product_entity.dart';
import 'package:fruits_ecommerce/core/widget/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products, this.itemCount});

  final List<ProductEntity> products;
  final int? itemCount;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: itemCount != null
          ? (products.length >= itemCount! ? itemCount : products.length)
          : products.length,
      itemBuilder: (BuildContext context, int index) {
        return FruitItem(product: products[index],);
      },
    );
  }
}
