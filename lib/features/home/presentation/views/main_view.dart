import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/products_view.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomeView(),
          ProductsView(),
          ProductsView(),
          ProductsView(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTap: (index){
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }
}

