import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

