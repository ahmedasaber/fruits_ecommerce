import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/bottom_naviagtion_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30)
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 7,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: BottomNavigationBarEntity.bottomNavigationBarItems.map((e) =>
            NavigationBarItem(isSelected: false, barEntity: e,)
        ).toList()
      ),
    );
  }
}
