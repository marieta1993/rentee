import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentee/domain/models/room/room_model.dart';
import 'package:rentee/presentation/screens/home/main/booking_provider.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_booking/payment_details/payment_screen.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:rentee/presentation/screens/widgets/card_room_item_widget.dart';
import 'package:uikit/uikit.dart';

class BookingRoomScreen extends StatefulWidget {
  const BookingRoomScreen({super.key, required this.roomId});
  final String roomId;

  @override
  State<BookingRoomScreen> createState() => _BookingRoomScreenState();
}

class _BookingRoomScreenState extends State<BookingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: context.read<RoomProvider>().getRoomWithId(widget.roomId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data'));
          }

          RoomModel room = RoomModel.fromDocument(snapshot.data!);

          return FutureBuilder(
              future: context.read<RoomProvider>().getRoomAddress(
                  room.address.latitude, room.address.longitude),
              builder: (context, address) {
                return Scaffold(
                    appBar: BookingAppBarWidget(
                      title: "Booking",
                      onBackClick: () {
                        Navigator.pop(context);
                      },
                    ),
                    body: SafeArea(
                      child: ListView(padding: paddingAll32, children: [
                        CardRoomItemWidget(
                          cardColor: RenteeColors.additional6,
                          itemTitle: room.title,
                          itemPrice: double.parse(room.price.toString()),
                          itemBathCount: room.bathCount,
                          itemBedCount: room.bedCount,
                          itemLocation: address.data,
                          itemRating: room.rating,
                          imgSrc: room.imgUrl[0],
                        ),
                        SizedBox(
                          height: 0.65.sh,
                          child: Consumer<BookingProvider>(
                              builder: (context, provider, _) {
                            return Form(
                                key: provider.formBookingKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            provider.selectBookingDate(context);
                                          },
                                          child: AbsorbPointer(
                                            child: RenteeInputField(
                                              controller: provider
                                                  .bookingDateController,
                                              placeholder: 'Select Date',
                                              keyboardType:
                                                  TextInputType.datetime,
                                            ),
                                          ),
                                        ),
                                        15.heightBox,
                                        RenteeInputField(
                                          controller:
                                              provider.numOfGuestController,
                                          label: 'Number of guest',
                                          keyboardType: TextInputType.number,
                                          placeholder: '2',
                                        ),
                                        15.heightBox,
                                        RenteeInputField(
                                          controller:
                                              provider.countOfDayController,
                                          label: 'Count of day',
                                          keyboardType: TextInputType.number,
                                          placeholder: '1',
                                        ),
                                      ],
                                    ),
                                    RenteeElevatedButton(
                                      text: 'Booking',
                                      onPress: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => PaymentScreen(
                                                  roomId: room.id),
                                            ));
                                      },
                                    ),
                                  ],
                                ));
                          }),
                        )
                      ]),
                    ));
              });
        });
  }
}
