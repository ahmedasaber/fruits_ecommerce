import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_function/get_dummy_products.dart';
import '../../../../../core/widget/custom_error_widget.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var paddingSize = MediaQuery.of(context).size.height * .4;
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesSuccess) {
          var favProducts = state.favProducts;
          MediaQuery.of(context).size.height * .6;
          if(favProducts.isEmpty){
            return SliverToBoxAdapter(child: Padding(
              padding: EdgeInsets.symmetric(vertical: paddingSize),
              child: CustomErrorWidget(errMessage: S.of(context).noFavorites,),
            ));
          }else {
            return ProductsGridView(products: state.favProducts, itemCount: state.favProducts.length,);
          }
        }else if(state is FavoritesFailure){
          return SliverToBoxAdapter(child: Padding(
            padding:  EdgeInsets.symmetric(vertical: paddingSize),
            child: CustomErrorWidget(errMessage: state.errMessage,),
          ));
        }else {
          return Skeletonizer.sliver(
              child: ProductsGridView(products: getDummyProducts(),)
          );
        }
      },
    );
  }
}
