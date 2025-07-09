import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/active_bottom_bar_item.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/inactive_bottom_bar_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({super.key, required this.isSelected, required this.barEntity});
  final BottomNavigationBarEntity barEntity;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return isSelected? ActiveItem(iconPath: barEntity.activeIcon) : InActiveItem(iconPath: barEntity.inActiveIcon);
  }
}