import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class CardBigRoomItem extends StatelessWidget {
  const CardBigRoomItem(
      {super.key,
      this.onItemClick,
      this.imgSrc,
      this.itemTitle,
      this.itemPrice,
      this.itemLocation,
      this.itemRating,
      this.itemBathCount,
      this.itemBedCount,
      this.cardColor});

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
    return Container(
      width: 240.sp,
      margin: paddingR20,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: circularRadius15,
        color: RenteeColors.additional6,
      ),
      child: InkWell(
        borderRadius: circularRadius15,
        onTap: onItemClick,
        child: Padding(
          padding: paddingAll10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: circularRadius15,
                child: Image.network(
                  imgSrc ?? '',
                  fit: BoxFit.fitHeight,
                  width: 215.sp,
                  height: 147.sp,
                ),
              ),
              15.heightBox,
              Flexible(
                child: Text(
                  itemTitle ?? '',
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: ptSerifH5.copyWith(color: RenteeColors.additional1),
                ),
              ),
              10.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: RenteeColors.additional1),
                        borderRadius: circularRadius10),
                    padding: paddingH14V6,
                    child: Text(
                      '\$$itemPrice/1 day',
                      style: notoP3.copyWith(color: RenteeColors.additional1),
                    ),
                  ),
                  // RenteeAssets.icons.heart.svg(),
                  Text(
                    itemLocation ?? '',
                    style: notoH5.copyWith(
                      color: RenteeColors.additional1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              10.heightBox,
              Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RenteeAssets.icons.bedroom.svg(),
                        Text(itemBedCount.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RenteeAssets.icons.bathroom.svg(),
                        10.horizontalSpace,
                        Text(itemBathCount.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RenteeAssets.icons.star.svg(),
                        10.horizontalSpace,
                        Text(itemRating.toString()),
                      ],
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
