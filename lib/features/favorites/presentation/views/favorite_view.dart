import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/repos/products_repo/products_repo.dart';
import 'package:fruits_ecommerce/core/services/get_it_service.dart';
import 'package:fruits_ecommerce/core/widget/build_app_bar.dart';
import 'package:fruits_ecommerce/features/favorites/domain/repo/favorites_repo.dart';
import 'package:fruits_ecommerce/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:fruits_ecommerce/features/favorites/presentation/views/widgets/favorite_view_body.dart';
import 'package:fruits_ecommerce/generated/l10n.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  static const routeName = '/favorites';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context: context, title: S.of(context).favorites, showNotificationBt: false),
      body: BlocProvider(
        create: (context) => FavoritesCubit(getIt<ProductsRepo>(), getIt<FavoritesRepo>())..getFavProducts(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: CustomScrollView(slivers: [FavoritesViewBody()]),
        ),
      ),
    );
  }
}
