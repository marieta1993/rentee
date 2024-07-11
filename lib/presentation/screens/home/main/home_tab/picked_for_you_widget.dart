import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class PickedForYou extends StatelessWidget {
  const PickedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: paddingH32V20,
        child: Text(
          "Picked for you",
          textAlign: TextAlign.left,
          style: notoH3.copyWith(
            color: RenteeColors.additional1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Container(
          margin: paddingL24,
          height: 285.sp,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                width: 240.sp,
                margin: paddingR20,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                  borderRadius: circularRadius15,
                  color: RenteeColors.additional6,
                ),
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
                          "https://images.unsplash.com/flagged/photo-1590227000970-3ae55d48501e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          fit: BoxFit.fitHeight,
                          width: 215.sp,
                          height: 147.sp,
                        ),
                      ),
                      15.heightBox,
                      Flexible(
                        child: Text(
                          'Minimalism Room',
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: ptSerifH5.copyWith(
                              color: RenteeColors.additional1),
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
                                border:
                                    Border.all(color: RenteeColors.additional1),
                                borderRadius: circularRadius10),
                            padding: paddingH14V6,
                            child: Text(
                              "\$12.50/1 hour",
                              style: notoP3.copyWith(
                                  color: RenteeColors.additional1),
                            ),
                          ),
                          // RenteeAssets.icons.heart.svg(),
                          Text(
                            "Phu Nhuan",
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
                                const Text('1'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RenteeAssets.icons.bathroom.svg(),
                                10.horizontalSpace,
                                const Text('1'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RenteeAssets.icons.star.svg(),
                                10.horizontalSpace,
                                const Text('5.0'),
                              ],
                            ),
                          ]),
                    ],
                  ),
                ),
              );
            },
            padding: paddingAll8,
            scrollDirection: Axis.horizontal,
          )),
    ]);
  }
}
