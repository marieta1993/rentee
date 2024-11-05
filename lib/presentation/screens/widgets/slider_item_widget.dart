import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SliderItemWidget extends StatelessWidget {
  const SliderItemWidget(
      {super.key,
      this.onItemClick,
      this.imgSrc,
      this.itemTitle,
      this.itemPrice,
      this.itemLocation,
      this.itemRating,
      this.itemBathCount,
      this.itemBedCount,
      this.cardColor,
      this.showAddressInSlider = true});

  final VoidCallback? onItemClick;
  final String? imgSrc;
  final String? itemTitle;
  final double? itemPrice;
  final String? itemLocation;
  final int? itemRating;
  final int? itemBathCount;
  final int? itemBedCount;
  final Color? cardColor;
  final bool showAddressInSlider;
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        margin: padding0,
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: circularRadius15,
          child: Image.network(
            imgSrc ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: onItemClick,
          child: Container(
            padding: paddingH20V25,
            decoration: BoxDecoration(
              borderRadius: circularRadius12,
              color: Colors.black.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        itemTitle ?? '',
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style:
                            ptSerifH3.copyWith(color: RenteeColors.additional5),
                      ),
                    ),
                  ],
                ),
                13.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: RenteeColors.white),
                          borderRadius: circularRadius10),
                      padding: paddingH14V6,
                      child: Text(
                        '\$${itemPrice.toString()}/1 day',
                        style: notoP3.copyWith(color: RenteeColors.additional5),
                      ),
                    ),
                    // RenteeAssets.icons.heart.svg(),
                    showAddressInSlider
                        ? Text(
                            itemLocation!,
                            style: notoH5.copyWith(
                                color: RenteeColors.additional7),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
