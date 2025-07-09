import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/widget/custom_best_selling_app_bar.dart';
import 'package:fruits_ecommerce/features/best_selling_fruits/presentaion/views/widgets/best_selling_fruits_view_body.dart';

class BestSellingFruitsView extends StatelessWidget {
  const BestSellingFruitsView({super.key});

  static const routeName = 'best selling';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BestSellingFruitsViewBody(),
    );
  }
}
