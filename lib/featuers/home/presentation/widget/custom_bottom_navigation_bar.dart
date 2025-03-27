import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<String> activeIcons;
  final List<String> inactiveIcons;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.activeIcons,
    required this.inactiveIcons,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(activeIcons.length, (index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              width: 62,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    isSelected ? activeIcons[index] : inactiveIcons[index],
                    height: 24,
                    width: 24,
                    fit: BoxFit.scaleDown,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
