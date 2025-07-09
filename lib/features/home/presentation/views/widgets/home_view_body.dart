import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/widget/custom_search_textfield.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/featured_list.dart';

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
                  SizedBox(height: 16,),
                  CustomSearchTextField(),
                  SizedBox(height: 12,),
                  FeaturedList(),
                  SizedBox(height: 12,),
                  BestSellingHeader(),
                  SizedBox(height: 8,),
                ],
              ),
            ),
            BestSellingGridView(),
          ],
        ),
      ),
    );
  }
}