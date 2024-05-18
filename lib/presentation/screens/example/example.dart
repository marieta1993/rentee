import 'package:flutter/material.dart';
import 'package:rentee/presentation/screens/example/bottom_navigation_bar_example.dart';
import 'package:rentee/presentation/screens/example/buttons_example.dart';
import 'package:rentee/presentation/screens/example/colors_example.dart';
import 'package:rentee/presentation/screens/example/headers_example.dart';
import 'package:rentee/presentation/screens/example/input_text_example.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Headers"),
              Tab(text: "Buttons"),
              Tab(text: "Colors"),
              Tab(text: "Form fields"),
              Tab(text: "Bottom Bar"),
            ],
          ),
          title: const Text('Styleguide - UI Components'),
        ),
        body: const TabBarView(
          children: [
            HeadersExample(),
            ButtonsExample(),
            ColorsExample(),
            InputTextExample(),
            BottomNavigationBarExampleApp()
          ],
        ),
      ),
    );
  }
}
