import 'package:flutter/material.dart';
import 'package:uikit/src/widgets/buttons/rentee_icon_button.dart';

class RenteeAppBar extends StatelessWidget {
  final String? title;
  final Widget? leading;
  const RenteeAppBar({this.title, this.leading, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ??
          const RenteeIconButton(
            icon: Icon(Icons.arrow_back),
          ),
      title: Text(title ?? ''),
    );
  }
}
