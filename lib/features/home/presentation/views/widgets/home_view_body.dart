import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/products%20cubit/products_cubit.dart';
import 'package:fruits_ecommerce/core/widget/custom_search_textfield.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/best_selling_view_bloc_builder.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/featured_list.dart';

import 'custom_home_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().loadBestSellingProducts();
    context.read<ProductsCubit>().loadProducts();
    super.initState();
  }
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
            BestSellingGridViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}