import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.title,
    required this.icon,
    this.isSelected = false,
    this.itemOnClicked,
  });
  final String title;
  final SvgGenImage icon;
  final bool isSelected;
  final VoidCallback? itemOnClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: circularRadius15,
      onTap: itemOnClicked,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: circularRadius15,
          color: isSelected ? RenteeColors.tertiary : RenteeColors.additional5,
        ),
        child: Padding(
          padding: paddingH14V18,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 66,
            ),
            child: Column(
              children: [
                icon.svg(
                    colorFilter: ColorFilter.mode(
                  isSelected ? RenteeColors.accent2 : RenteeColors.additional4,
                  BlendMode.srcIn,
                )),
                10.verticalSpace,
                Text(
                  title,
                  style: notoH5.copyWith(
                    color: isSelected
                        ? RenteeColors.accent2
                        : RenteeColors.additional4,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
