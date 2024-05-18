import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatefulWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  State<BottomNavigationBarExampleApp> createState() =>
      _BottomNavigationBarExampleAppState();
}

class _BottomNavigationBarExampleAppState
    extends State<BottomNavigationBarExampleApp> {
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
  ];
  static const List<RenteeTabItem> _tabItems = <RenteeTabItem>[
    RenteeTabItem(
      title: 'Home',
      icon: Icon(Icons.home),
    ),
    RenteeTabItem(
      title: 'Business',
      icon: Icon(Icons.business),
    ),
    RenteeTabItem(
      title: '',
      icon: Icon(Icons.school),
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
