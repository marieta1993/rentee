import 'package:flutter/material.dart';
import 'package:uikit/src/theme/rentee_colors.dart';

class RenteeTabItem {
  final String? title;
  final Widget icon;

  // final Widget selectedIcon;

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
            label: "", //item.title,
            icon: item.icon,
            activeIcon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: RenteeColors.additional2,
              ),
              child: item.icon,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color:  Colors.transparent,
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              backgroundColor: backgroundColor ?? RenteeColors.additional1,
              items: getBottomTabs(items),
              currentIndex: selectedIndex,
              unselectedItemColor: RenteeColors.additional4,
              selectedItemColor: RenteeColors.white,
              onTap: onItemTapped),
        ),
      ),
    );
  }
}
