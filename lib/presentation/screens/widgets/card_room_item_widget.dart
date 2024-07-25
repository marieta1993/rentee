import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class CardRoomItemWidget extends StatelessWidget {
  const CardRoomItemWidget({
    super.key,
    this.onItemClick,
    this.imgSrc,
    this.itemTitle,
    this.itemPrice = 0.0,
    this.itemLocation,
    this.itemRating,
    this.itemBathCount,
    this.itemBedCount,
    this.cardColor = RenteeColors.tertiary,
  });

  final VoidCallback? onItemClick;
  final String? imgSrc;
  final String? itemTitle;
  final double? itemPrice;
  final String? itemLocation;
  final int? itemRating;
  final int? itemBathCount;
  final int? itemBedCount;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onItemClick,
        borderRadius: circularRadius15,
        child: Card(
          color: cardColor,
          margin: padding0,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 11.0,
              right: 21,
              top: 11,
              bottom: 11,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: circularRadius15,
                  child: Image.network(
                    imgSrc ?? '',
                    fit: BoxFit.fitHeight,
                    width: 81.sp,
                    height: 91.sp,
                  ),
                ),
                20.widthBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          itemTitle ?? '',
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: ptSerifH5.copyWith(
                              color: RenteeColors.additional1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: RenteeColors.additional1),
                                  borderRadius: circularRadius10),
                              padding: paddingH14V6,
                              child: Text(
                                "\$$itemPrice /1 day",
                                style: notoP3.copyWith(
                                    color: RenteeColors.additional1),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                itemLocation ?? '',
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: notoH5.copyWith(
                                  color: RenteeColors.additional1,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  itemBedCount != null
                                      ? SizedBox(
                                          child: Row(
                                            verticalDirection:
                                                VerticalDirection.up,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              RenteeAssets.icons.bedroom.svg(),
                                              10.widthBox,
                                              Text(
                                                itemBedCount.toString(),
                                                style: notoP3,
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  itemBathCount != null
                                      ? Row(
                                          verticalDirection:
                                              VerticalDirection.up,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            RenteeAssets.icons.bathroom.svg(),
                                            10.widthBox,
                                            Text(
                                              itemBathCount.toString(),
                                              style: notoP3,
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                  itemRating != null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            RenteeAssets.icons.star.svg(),
                                            10.widthBox,
                                            Text(
                                              itemRating.toString(),
                                              style: notoP3,
                                            ),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                ]),
                          ),
                        ],
                      )
                    ],
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
