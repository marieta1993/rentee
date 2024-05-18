import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_colors.dart';

class RenteeTabItem {
  final String? title;
  final Widget icon;

  const RenteeTabItem({this.title, required this.icon});
}

class RenteeBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onItemTapped;
  final List<RenteeTabItem> items;
  final Color? backgroundColor;

  const RenteeBottomNavigationBar({
    required this.selectedIndex,
    this.onItemTapped,
    required this.items,
    this.backgroundColor,
    super.key,
  });

  List<BottomNavigationBarItem> getBottomTabs(List<RenteeTabItem> tabs) {
    return tabs
        .map(
          (item) => BottomNavigationBarItem(
            label: item.title,
            icon: item.icon,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: RenteeColors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: backgroundColor ?? RenteeColors.additional1,
            items: getBottomTabs(items),
            currentIndex: selectedIndex,
            unselectedItemColor: RenteeColors.additional4,
            selectedItemColor: RenteeColors.white,
            onTap: onItemTapped),
      ),
    );
  }
}
