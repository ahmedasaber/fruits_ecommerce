import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/helper_function/get_dummy_products.dart';
import 'package:fruits_ecommerce/core/products%20cubit/products_cubit.dart';
import 'package:fruits_ecommerce/core/widget/custom_search_textfield.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:fruits_ecommerce/features/search/presentation/cubit/history_search_cubit.dart';
import 'package:fruits_ecommerce/features/search/presentation/views/widgets/history_search_bloc_builder.dart';
import 'package:fruits_ecommerce/features/search/presentation/views/widgets/not_found_body.dart';
import 'package:fruits_ecommerce/features/search/presentation/views/widgets/result_header.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key, required this.query});

  final String query;
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController controller;

  @override
  void initState(){
    super.initState();
    controller = TextEditingController(text: widget.query);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final historyCubit = context.read<HistorySearchCubit>();
      await historyCubit.loadHistory();

      if (widget.query.trim().isNotEmpty) {
        historyCubit.addHistory(widget.query.trim());
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
           if (state is ProductsFailure) {
             showErrorBar(context, state.errMessage);
           }
        },
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: CustomSearchTextField(
                  controller: controller,
                  onSubmitted: (value) async {
                    if(value.trim().isNotEmpty){
                      context.read<HistorySearchCubit>().addHistory(controller.text.trim());
                      context.read<ProductsCubit>().loadSearchedProducts(query: controller.text.trim());
                    }
                  },
                  onChanged: (value){
                    if(controller.text.trim().isEmpty){
                      context.read<ProductsCubit>().loadSearchedProducts(query: controller.text.trim());
                    }
                  },
                ),
              ),
              if (state is ProductsSuccess) ...[
                if(state.products.isEmpty)...[
                  SliverToBoxAdapter(child: NotFoundBody(),),
                ] else...[
                  SliverToBoxAdapter(child: ResultHeader(),),
                  ProductsGridView(products: state.products),
                ]
              ] else if (state is ProductsLoading) ...[
                ...[
                  SliverToBoxAdapter(child: ResultHeader(),),
                  Skeletonizer.sliver(child: ProductsGridView(products: getDummyProducts()))
                ],
              ] else if (state is ProductsInitial) ...[
                HistorySearchBlocBuilder(controller: controller),
              ],
            ],
          );
        },
      ),
    );
  }
}