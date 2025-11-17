import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/products%20cubit/products_cubit.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/search/presentation/cubit/history_search_cubit.dart';
import 'package:fruits_ecommerce/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});

  final String query;
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context: context, title: S.of(context).search),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductsCubit(getIt<ProductsRepo>())..loadSearchedProducts(query: query),
          ),
          BlocProvider(
            create: (context) => HistorySearchCubit(),
          ),
        ],
        child: SearchViewBody(query: query,),
      ),
    );
  }
}
