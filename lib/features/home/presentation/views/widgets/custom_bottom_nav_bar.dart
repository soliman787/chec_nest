import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> items;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final double elevation;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    this.elevation = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(items.length >= 2,
    'The number of items in the BottomNavigationBar must be at least 2.');
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(.2),
            width: .6,
          ),
        ),
      ),
      child: BottomNavigationBar(
        elevation: elevation,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
      ),
    );
  }
}
