import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/bottom_sheet.dart';
import 'package:fruits_ecommerce/core/products%20cubit/products_cubit.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/core/widget/custom_search_textfield.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/products_bloc_builder.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/products_view_header.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/sort_sheet_body.dart';
import 'package:fruits_ecommerce/features/search/presentation/views/search_view.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().loadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildCustomAppBar(
                    context: context,
                    title: S.of(context).products,
                    showBackBt: false,
                  ),
                  SizedBox(height: 16),
                  CustomSearchTextField(onSubmitted: (value){
                    Navigator.pushNamed(context, SearchView.routeName, arguments: value.trim());
                  },),
                  SizedBox(height: 12),
                  ProductsViewHeader(
                    count: context.read<ProductsCubit>().productsLength,
                    onTapFilter: () async{
                      final result = await showBottomSheetFilter(context, child: SortSheet());
                      if (!context.mounted) return;
                      context.read<ProductsCubit>().loadFilteredProducts(query: result);
                    },
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            ProductsGridViewBlocBuilder(),
            SliverToBoxAdapter(child: SizedBox(height: 16,)),
          ],
        ),
      ),
    );
  }
}
