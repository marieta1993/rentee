import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: "USA", child: Text("USA")),
    DropdownMenuItem(value: "Canada", child: Text("Canada")),
    DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItems;
}

class InputTextExample extends StatefulWidget {
  const InputTextExample({super.key});

  @override
  State<InputTextExample> createState() => _InputTextExampleState();
}

class _InputTextExampleState extends State<InputTextExample> {
  int selectedValue = 0;
  bool val = false;
  String? selectedItem;
  onChanged() {
    (String? newValue) {
      setState(() {
        selectedItem = newValue!;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
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
              RenteeDropdownButton(
                label: 'Dropdown',
                options: dropdownItems,
                onChanged: onChanged,
              ),
              RenteeRadioButton(
                value: 0,
                option: 'Option 1',
                selectedValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              RenteeRadioButton(
                value: 1,
                option: 'Option 2',
                selectedValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              RenteeToggle(
                value: val,
                onChanged: () {
                  setState(() {
                    val = !val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
