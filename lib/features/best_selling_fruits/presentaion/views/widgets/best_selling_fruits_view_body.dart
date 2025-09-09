import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_ecommerce/core/products%20cubit/products_cubit.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/products_bloc_builder.dart';

class BestSellingFruitsViewBody extends StatefulWidget {
  const BestSellingFruitsViewBody({super.key});

  @override
  State<BestSellingFruitsViewBody> createState() => _BestSellingFruitsViewBodyState();
}

class _BestSellingFruitsViewBodyState extends State<BestSellingFruitsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().loadBestSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: CustomScrollView(slivers: [ProductsGridViewBlocBuilder()]),
    );
  }
}
