import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_details/room_details_screen.dart';
import 'package:rentee/presentation/screens/widgets/card_room_item_widget.dart';
import 'package:uikit/uikit.dart';

class NearToYou extends StatelessWidget {
  const NearToYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32),
        child: Text(
          "Near to you",
          textAlign: TextAlign.left,
          style: notoH3.copyWith(
              color: RenteeColors.additional1, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          height: 380.sp,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CardRoomItemWidget(
                cardColor: RenteeColors.tertiary,
                itemTitle: 'Blaaa',
                itemPrice: 12.0,
                itemBathCount: 2,
                itemBedCount: 4,
                itemLocation: 'asedrftyui',
                itemRating: 5,
                imgSrc:
                    "https://images.unsplash.com/flagged/photo-1590227000970-3ae55d48501e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                onItemClick: () {
                  onItemClick(context);
                },
              );
            },
            // padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,

            itemCount: 3,
          )),
    ]);
  }

  onItemClick(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RoomDetailsScreen()),
    );
  }
}
