import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/feature_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView(
        children: List.generate(4, (i) => const FeatureItem()),
      ),
    );
  }
}
