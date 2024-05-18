import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uikit/src/theme/rentee_border_styles.dart';
import 'package:uikit/src/theme/rentee_colors.dart';
import 'package:uikit/uikit.dart';

class RenteeToggle extends StatefulWidget {
  final bool value;
  final VoidCallback? onChanged;

  const RenteeToggle({super.key, required this.value, this.onChanged});

  @override
  State<RenteeToggle> createState() => _RenteeToggleState();
}

class _RenteeToggleState extends State<RenteeToggle> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 40,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: borderRounded8,
              color: widget.value
                  ? RenteeColors.additional5
                  : RenteeColors.primary,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: widget.value ? 15.0 : 0.0,
                  child: GestureDetector(
                    onTap: widget.onChanged,
                    child: Padding(
                      padding: paddingAll4,
                      child: ClipRRect(
                        borderRadius: borderRounded4,
                        child: Container(
                          width: 16.0,
                          height: 16.0,
                          color: widget.value
                              ? RenteeColors.additional4
                              : RenteeColors.additional5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
