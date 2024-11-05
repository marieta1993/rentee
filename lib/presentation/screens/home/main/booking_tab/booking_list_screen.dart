import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentee/domain/models/booking_data/booking_model.dart';
import 'package:rentee/domain/models/room/room_model.dart';
import 'package:rentee/presentation/screens/home/main/booking_tab/booked_item_details_screen.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/presentation/screens/widgets/booking_item_widget.dart';
import 'package:rentee/utils/extensions/date.dart';
import 'package:uikit/uikit.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key, required this.bookingList});
  final List<BookingModel> bookingList;

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  int _sliding = 0;

  final _children = {
    0: Text("Ongoing", style: notoH4.copyWith(color: RenteeColors.additional3)),
    1: Text("Past", style: notoH4.copyWith(color: RenteeColors.additional3)),
  };
  Stream<DocumentSnapshot> getRoomWithId(String id) {
    return context.read<RoomProvider>().getRoomWithId(id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
          child: CustomSlidingSegmentedControl<int>(
            // controller: controller,
            padding: 32,
            isStretch: true,
            initialValue: _sliding,
            height: 48,
            children: _children,
            decoration: BoxDecoration(
              color: RenteeColors.additional5,
              borderRadius: BorderRadius.circular(15),
            ),
            thumbDecoration: BoxDecoration(
              color: RenteeColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),

            onValueChanged: (v) {
              setState(() {
                _sliding = v;
              });
            },
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ListView.builder(
              itemBuilder: (context, index) {
                BookingModel booking = widget.bookingList[index];

                return StreamBuilder<DocumentSnapshot>(
                    stream: getRoomWithId(booking.roomId),
                    builder: (context, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return const Center(child: CircularProgressIndicator());
                      // }

                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return const Center(child: Text('No data available'));
                      }

                      RoomModel room = RoomModel.fromDocument(snapshot.data!);
                      return BookingItemWidget(
                          onItemClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BookedItemDetailsScreen(
                                        room: room,
                                        booking: booking,
                                      )),
                            );
                          },
                          buttonText: 'See detail',
                          itemTitle: room.title,
                          imgSrc: room.imgUrl[0],
                          bookingTime: booking.bookingFromTime.timeFromDate,
                          bookingDate: booking.bookingFromTime.shortDate);
                    });
              },
              scrollDirection: Axis.vertical,

              itemCount: widget.bookingList.length,
              // const PickedForYou(),
            ),
          ),
        ),
      ],
    );
  }
}
