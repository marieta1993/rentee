import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_booking/booking_complete_screen.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:rentee/presentation/screens/widgets/card_room_item_widget.dart';
import 'package:uikit/uikit.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBarWidget(
        title: "Check out",
        onBackClick: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: ListView(
          padding: paddingAll32,
          children: [
            CardRoomItemWidget(
              cardColor: RenteeColors.additional6,
              itemTitle: 'Blaaa',
              itemPrice: 12.0,
              itemBathCount: 2,
              itemBedCount: 4,
              itemLocation: '1.2 km',
              itemRating: 5,
              imgSrc:
                  "https://images.unsplash.com/flagged/photo-1590227000970-3ae55d48501e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              onItemClick: () {},
            ),
            SizedBox(
                height: 0.65.sh,
                // width: 1.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      contentPadding: padding0,
                      isThreeLine: false,
                      title: Padding(
                        padding: paddingB15,
                        child: Text(
                          'Payment detail',
                          style: notoH5.copyWith(
                            color: RenteeColors.additional2,
                          ),
                        ),
                      ),
                      minVerticalPadding: 20,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price',
                                style: notoH4.copyWith(
                                    color: RenteeColors.additional3),
                              ),
                              Text(
                                '\$21.00',
                                style: notoH3.copyWith(
                                    color: RenteeColors.additional1),
                              ),
                            ],
                          ),
                          21.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: notoH4.copyWith(
                                    color: RenteeColors.additional3),
                              ),
                              Text(
                                '\$2.00',
                                style: notoH3.copyWith(
                                    color: RenteeColors.additional1),
                              ),
                            ],
                          ),
                          21.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total price',
                                style: notoH4.copyWith(
                                    color: RenteeColors.additional3),
                              ),
                              Text(
                                '\$19.00',
                                style: notoH3.copyWith(
                                    color: RenteeColors.additional1),
                              ),
                            ],
                          ),
                          21.verticalSpace,
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const BookingCompleteScreen()),
                                );
                              },
                              child: const Text('Check out')),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
