import 'package:flutter/material.dart';
import 'package:rentee/presentation/screens/example/bottom_navigation_bar_example.dart';
import 'package:rentee/presentation/screens/example/buttons_example.dart';
import 'package:rentee/presentation/screens/example/colors_example.dart';
import 'package:rentee/presentation/screens/example/headers_example.dart';
import 'package:rentee/presentation/screens/example/input_text_example.dart';
import 'package:rentee/presentation/screens/splash/splash_screen.dart';
import 'package:rentee/utils/extensions/context_localization.dart';
import 'package:uikit/uikit.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  appViewOnPressed() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: context.localized.helloWorld),
              const Tab(text: "Buttons"),
              const Tab(text: "Colors"),
              const Tab(text: "Form fields"),
              const Tab(text: "Bottom Bar"),
            ],
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('UI Components'),
              15.widthBox,
              ElevatedButton.icon(
                onPressed: appViewOnPressed,
                icon: const Icon(Icons.view_agenda_outlined),
                label: const Text('App view'),
              )
            ],
          ),
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
