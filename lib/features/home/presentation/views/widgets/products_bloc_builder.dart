import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/get_dummy_products.dart';
import 'package:fruits_ecommerce/core/products%20cubit/products_cubit.dart';
import 'package:fruits_ecommerce/core/widget/custom_error_widget.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(products: state.products,);
        }else if(state is ProductsFailure){
          return SliverToBoxAdapter(child: CustomErrorWidget(errMessage: state.errMessage,));
        }else {
          return Skeletonizer.sliver(
            child: ProductsGridView(products: getDummyProducts(),)
          );
        }
      },
    );
  }
}