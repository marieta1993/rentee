import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_details/payment_screen.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:rentee/presentation/screens/widgets/card_room_item_widget.dart';
import 'package:uikit/uikit.dart';

class BookingRoomScreen extends StatefulWidget {
  const BookingRoomScreen({super.key});

  @override
  State<BookingRoomScreen> createState() => _BookingRoomScreenState();
}

class _BookingRoomScreenState extends State<BookingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBarWidget(
        title: "Booking",
        onBackClick: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
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
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    children: [
                      RenteeInputField(
                        label: 'Booking time',
                        placeholder: 'Eg: 12:00 am',
                        prefixIcon: RenteeAssets.icons.time.svg(),
                      ),
                      15.heightBox,
                      RenteeInputField(
                        label: 'Booking date',
                        placeholder: '12/12/2021',
                        prefixIcon: RenteeAssets.icons.date.svg(),
                      ),
                      15.heightBox,
                      RenteeInputField(
                        label: 'Number of guest',
                        placeholder: '2',
                      ),
                    ],
                  ),
                  RenteeElevatedButton(
                    text: 'Booking',
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PaymentScreen(),
                          ));
                    },
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
