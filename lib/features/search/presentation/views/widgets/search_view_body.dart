import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/constants.dart';
import 'package:fruits_ecommerce/core/helper_function/error_snack_bar.dart';
import 'package:fruits_ecommerce/core/helper_function/get_dummy_products.dart';
import 'package:fruits_ecommerce/core/products%20cubit/products_cubit.dart';
import 'package:fruits_ecommerce/core/services/shared_preferences_singleton.dart';
import 'package:fruits_ecommerce/core/widget/custom_search_textfield.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/products_grid_view.dart';
import 'package:fruits_ecommerce/features/search/presentation/views/widgets/histories_item.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key, required this.query});

  final String query;
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  List<String> histories = [];

  late TextEditingController controller;
  @override
  void initState(){
    super.initState();
    controller = TextEditingController(text: widget.query);
    _getHistories();
  }

  void saveSearchToHistory(String value) {
    histories.insert(0, value);
    AppPrefs.setStrings(kHistoryKey, histories);
  }

  Future<void> _getHistories() async {
    histories = await AppPrefs.getStrings(kHistoryKey);
    if (!mounted) return;
    setState(() {
      if(widget.query.trim().isNotEmpty){
        saveSearchToHistory(widget.query.trim());
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
                    saveSearchToHistory(value);
                    context.read<ProductsCubit>().loadSearchedProducts(query: value);
                  },
                  onChanged: (value){
                    if(value.trim().isEmpty){
                      context.read<ProductsCubit>().loadSearchedProducts(query: value);
                    }
                  },
                ),
              ),
              if (state is ProductsSuccess) ...[
                if(state.products.isEmpty)...[
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                        Image.asset('assets/images/search-image.png'),
                        Text('البحث', style: TextStyles.bold16),
                        Text('عفوًا... هذه المعلومات غير متوفرة للحظة', style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),)
                      ],
                    ),
                  ),
                ] else...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'نتائج البحث',
                        style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),
                      ),
                    ),
                  ),
                  ProductsGridView(products: state.products),
                ]
              ] else if (state is ProductsLoading) ...[
                Skeletonizer.sliver(child: ProductsGridView(products: getDummyProducts())),
              ] else if (state is ProductsInitial) ...[
                SliverToBoxAdapter(child: Column(
                  children: [
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'عمليات البحث الأخيرة',
                          style: TextStyles.semiBold13,
                        ),
                        InkWell(
                          onTap: (){
                            histories.clear();
                            AppPrefs.setStrings(kHistoryKey, []);
                            setState((){});
                          },
                          child: Text(
                            'حذف الكل',
                            style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),
                          ),
                        ),
                      ],
                    ),
                    ...List.generate(histories.length, (i){
                      return HistoriesItem(
                        text: histories[i],
                        onTap: () {
                          context.read<ProductsCubit>().loadSearchedProducts(query: histories[i]);
                        },
                        onDelete: () async{
                          histories.removeAt(i);
                          await AppPrefs.setStrings(kHistoryKey, histories);
                          if (!mounted) return;
                          setState(() {});
                        },);
                    }),
                  ],
                )),
              ],
            ],
          );
        },
      ),
    );
  }
}