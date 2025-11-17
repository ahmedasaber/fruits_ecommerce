import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/products%20cubit/products_cubit.dart';
import 'package:fruits_ecommerce/core/utils/app_colors.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';
import 'package:fruits_ecommerce/features/search/presentation/cubit/history_search_cubit.dart';
import 'package:fruits_ecommerce/features/search/presentation/views/widgets/histories_item.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class HistorySearchBlocBuilder extends StatelessWidget {
  const HistorySearchBlocBuilder({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var localization = S.of(context);
    return BlocBuilder<HistorySearchCubit, HistorySearchState>(
      builder: (context, state) {
        if(state is HistorySearchLoaded){
          List<String> histories = state.history;
          return SliverToBoxAdapter(child: Column(
            children: [
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(localization.recentSearches, style: TextStyles.semiBold13,),
                  InkWell(
                    onTap: () {
                      context.read<HistorySearchCubit>().deleteHistory();
                    },
                    child: Text(
                      localization.deleteAll,
                      style: TextStyles.regular13.copyWith(color: AppColors.hintTextColor),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:histories.length,
                  itemBuilder: (context, i){
                    return HistoriesItem(
                      text: histories[i],
                      onTap: () {
                        controller.text = histories[i];
                        context.read<ProductsCubit>().loadSearchedProducts(query: histories[i]);
                      },
                      onDelete: () {
                        context.read<HistorySearchCubit>().removeHistoryItem(i);
                      },);
                  }
              ),
            ],
          ));
        }else{
          return SliverToBoxAdapter(child: SizedBox(),);
        }
      },
    );
  }
}
