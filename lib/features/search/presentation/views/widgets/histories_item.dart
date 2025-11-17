import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/core/utils/app_text_style.dart';

class HistoriesItem extends StatelessWidget {
  const HistoriesItem({
    super.key, required this.text, required this.onTap, required this.onDelete,
  });
  final String text;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time, size: 24, color: Colors.grey),
        SizedBox(width: 16,),
        Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              text,
              style: TextStyles.regular16,
            ),
          ),
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.close, color: Colors.black87),
        ),
      ],
    );
  }
}
