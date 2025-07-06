import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/custom_shape.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage('assets/images/fruits.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomShape(),
        ],
      ),
    );
  }
}