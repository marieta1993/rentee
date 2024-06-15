import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

void main() => runApp(const TabMainScreen());

class TabMainScreen extends StatefulWidget {
  const TabMainScreen({super.key});

  @override
  State<TabMainScreen> createState() => _TabMainScreenState();
}

class _TabMainScreenState extends State<TabMainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];
  static List<RenteeTabItem> _tabItems = <RenteeTabItem>[
    RenteeTabItem(
      icon: RenteeAssets.icons.vector.svg(),
    ),
    RenteeTabItem(
      icon: RenteeAssets.icons.combinedShapeSvg.svg(),
    ),
    RenteeTabItem(
      icon: $AssetsIconsGen().heart.svg(),
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
      // appBar: RenteeAppBar(title: 'Ola',leading: Icon(Icons.add),),
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
