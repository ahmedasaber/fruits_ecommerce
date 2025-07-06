import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/widget/custom_search_textfield.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/feature_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomHomeAppBar(),
                  SizedBox(height: 8,),
                  CustomSearchTextField(),
                  SizedBox(height: 8,),
                  FeatureItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}