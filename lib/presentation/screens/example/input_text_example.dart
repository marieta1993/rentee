import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];
  return menuItems;
}

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
            const RenteeInputField.password(
              label: 'Title here',
            ),
            RenteeDropdownButton(label: 'Dropdown', options: dropdownItems),
            const RenteeRadioButton(
              label: 'Label',
              option: 'Option 1',
            )
          ],
        ),
      ),
    );
  }
}
