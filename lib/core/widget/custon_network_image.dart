import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, err, stackTrace) => SizedBox(
        height: 100,
        width: double.infinity,
        child: Image.asset(
          'assets/images/fruit-image.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
