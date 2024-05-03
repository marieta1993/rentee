import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class InputTextExample extends StatelessWidget {
  const InputTextExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
        child: Column(
          children: [
            const RenteeInputField(
              label: 'Title here',
            ),
            RenteeInputField(
              label: 'Title here',
              icon: RenteeAssets.icons.search.svg(),
            ),
            RenteeInputField(
              label: 'Title here',
              isSecure: true,
            ),
          ],
        ),
      ),
    );
  }
}
