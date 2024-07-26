import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class BookingItemWidget extends StatelessWidget {
  const BookingItemWidget({
    super.key,
    this.onItemClick,
    this.imgSrc,
    this.itemTitle,
    this.cardColor = RenteeColors.additional6,
    this.bookingTime,
    this.bookingDate,
    this.itemRating,
    required this.buttonText,
  });

  final VoidCallback? onItemClick;
  final String? imgSrc;
  final String? itemTitle;
  final String? bookingTime;
  final String? bookingDate;
  final int? itemRating;
  final String buttonText;
  final Color? cardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(
          11,
        ),
        child: InkWell(
          onTap: onItemClick,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imgSrc ?? '',
                  fit: BoxFit.fitHeight,
                  width: 81,
                  height: 91,
                ),
              ),
              20.horizontalSpace,
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
                        style:
                            ptSerifH5.copyWith(color: RenteeColors.additional1),
                      ),
                    ),
                    Padding(
                      padding: paddingV4,
                      child: Text(
                        '$bookingDate',
                        style: notoP4.copyWith(
                          color: RenteeColors.additional1,
                        ),
                      ),
                    ),
                    RenteeElevatedButton.tertiary(
                      text: buttonText,
                      onPress: onItemClick,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
