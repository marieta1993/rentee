import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class BookingAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const BookingAppBarWidget({
    super.key,
    this.onBackClick,
    this.title,
    this.hasShape = true,
    this.showLeading = true,
  });

  final VoidCallback? onBackClick;
  final String? title;
  final bool? hasShape;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              bottom: hasShape != null && hasShape!
                  ? const Radius.circular(25)
                  : const Radius.circular(0))),
      title: Container(
        height: 40,
        margin: paddingH32,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: showLeading
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            showLeading
                ? InkWell(
                    onTap: onBackClick,
                    child: SizedBox(
                      width: 27,
                      child: RenteeAssets.icons.back.svg(),
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              title ?? '',
              style: notoH2.copyWith(color: RenteeColors.additional5),
            ),
            const SizedBox()
          ],
        ),
      ),

      // bottom: buildAppBarImageCarousel(),
      backgroundColor: RenteeColors.additional1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
