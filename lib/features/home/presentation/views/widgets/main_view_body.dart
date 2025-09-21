import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/cart_view.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/products_view.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        HomeView(),
        ProductsView(),
        CartView(),
        SizedBox(),
      ],
    );
  }
}
