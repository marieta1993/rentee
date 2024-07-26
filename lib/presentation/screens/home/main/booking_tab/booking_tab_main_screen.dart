import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentee/domain/models/booking_data/booking_model.dart';
import 'package:rentee/presentation/screens/home/main/booking_provider.dart';
import 'package:rentee/presentation/screens/home/main/booking_tab/booking_list_screen.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home/home_screen.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home/home_screen_tab_main.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/presentation/screens/home/tab_main_screen.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:uikit/uikit.dart';

class BookingTabMainScreen extends StatefulWidget {
  const BookingTabMainScreen({super.key});

  @override
  State<BookingTabMainScreen> createState() => _BookingTabMainScreenState();
}

class _BookingTabMainScreenState extends State<BookingTabMainScreen> {
  // final Color thumbTextColor = RenteeColors.additional3;

  Stream<DocumentSnapshot> getRoomWithId(String id) {
    return context.read<RoomProvider>().getRoomWithId(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBarWidget(
        showLeading: false,
        title: "Booking",
        onBackClick: () => Navigator.pop(context),
      ),
      body: SafeArea(
        // child: bookingEmptyPageBuilder(context),
        child: bookingsListBuilder(context),
      ),
    );
  }

  bookingEmptyPageBuilder(context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 214),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              RenteeAssets.images.bookingEmpty.image(),
              38.verticalSpacingRadius,
              RichText(
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          'You haven’t got any booking yet. Go get your new accommodation!',
                      style: notoP2.copyWith(color: RenteeColors.additional3),
                      children: [
                        TextSpan(
                            text: " Go get your new accommodation! ",
                            style: notoP2.copyWith(
                                color: RenteeColors.additional1)),
                      ])),
              38.verticalSpacingRadius,
              Row(
                children: [
                  Expanded(
                    child: RenteeElevatedButton(
                      text: "Book now",
                      onPress: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const TabMainScreen(),
                            ));
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bookingsListBuilder(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: context.read<BookingProvider>().allBookingsList('past'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data'));
          }

          List<BookingModel> bookingList = snapshot.data!.docs.map((doc) {
            return BookingModel.fromDocument(doc);
          }).toList();

          return bookingList.isNotEmpty
              ? BookingListScreen(bookingList: bookingList)
              : bookingEmptyPageBuilder(context);
        });
  }
}
