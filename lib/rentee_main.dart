import 'package:flutter/material.dart';
import 'package:rentee/presentation/screens/example/example.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RenteeMain extends StatefulWidget {
  const RenteeMain({super.key, required this.title});
  final String title;

  @override
  State<RenteeMain> createState() => _RenteeMainState();
}

class _RenteeMainState extends State<RenteeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const ExampleScreen(),
    );
  }
}
