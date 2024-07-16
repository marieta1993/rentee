import 'package:flutter/material.dart';
import 'package:rentee/presentation/screens/home/main/booking_tab/booking_tab_main_screen.dart';
import 'package:rentee/presentation/screens/home/main/favorite_tab/favorite_screen.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home_screen.dart';
import 'package:uikit/uikit.dart';

void main() => runApp(const TabMainScreen());

class TabMainScreen extends StatefulWidget {
  const TabMainScreen({super.key});

  @override
  State<TabMainScreen> createState() => _TabMainScreenState();
}

class _TabMainScreenState extends State<TabMainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    BookingTabMainScreen(),
  ];
  static List<RenteeTabItem> _tabItems = <RenteeTabItem>[
    RenteeTabItem(
      icon: RenteeAssets.icons.homeUnselected.svg(),
    ),
    RenteeTabItem(
      icon: $AssetsIconsGen().heartUnselected.svg(),
    ),
    RenteeTabItem(
      icon: $AssetsIconsGen().bag.svg(),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: RenteeBottomNavigationBar(
        items: _tabItems,
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
