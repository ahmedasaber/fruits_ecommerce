import 'package:flutter/material.dart';
import 'package:fruits_ecommerce/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruits_ecommerce/features/home/presentation/views/widgets/bottom_naviagtion_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTap});
  final ValueChanged<int> onItemTap;
  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: BottomNavigationBarEntity.bottomNavigationBarItems.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;
            if (index == selectedIndex) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.onItemTap(index);
                  });
                },
                  child: NavigationBarItem(isSelected: true, barEntity: entity,
                ),
              );
            } else {
              return Expanded(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onItemTap(index);
                    });
                  },
                  child: NavigationBarItem(isSelected: false, barEntity: entity,),
                ),
              );
            }
          }).toList()
        ),
      ),
    );
  }
}
