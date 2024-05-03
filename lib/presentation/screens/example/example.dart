import 'package:flutter/material.dart';
import 'package:rentee/presentation/screens/example/buttons_example.dart';
import 'package:rentee/presentation/screens/example/colors_example.dart';
import 'package:rentee/presentation/screens/example/headers_example.dart';
import 'package:rentee/presentation/screens/example/input_text_example.dart';
import 'package:uikit/uikit.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Headers"),
              Tab(text: "Buttons"),
              Tab(text: "Colors"),
              Tab(text: "Input Text"),
            ],
          ),
          title: const Text('Styleguide - UI Components'),
        ),
        body: const TabBarView(
          children: [
            HeadersExample(),
            ButtonsExample(),
            ColorsExample(),
            InputTextExample()
          ],
        ),
      ),
    );
  }
}
