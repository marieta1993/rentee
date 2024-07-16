import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentee/presentation/screens/home/main/booking_tab/booking_item_details.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home_screen.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:rentee/presentation/screens/widgets/booking_item_widget.dart';
import 'package:uikit/uikit.dart';

class BookingTabMainScreen extends StatefulWidget {
  const BookingTabMainScreen({super.key});

  @override
  State<BookingTabMainScreen> createState() => _BookingTabMainScreenState();
}

class _BookingTabMainScreenState extends State<BookingTabMainScreen> {
  final int _sliding = 0;
  final Color thumbTextColor = RenteeColors.additional3;
  final _children = {
    0: Text("Ongoing", style: notoH4.copyWith(color: RenteeColors.additional3)),
    1: Text("Past", style: notoH4.copyWith(color: RenteeColors.additional3)),
  };

  bool isPast = false;
  bool isCurrent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBarWidget(
        title: "Booking",
        onBackClick: () => Navigator.pop(context),
      ),
      body: SafeArea(
        // child: bookingEmptyPageBuilder(context),
        child: bookingsListBuilder(),
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
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomeScreen()),
                            (route) => false);
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

  bookingsListBuilder() {
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
                isPast = v == 1;
              });
            },
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return BookingItemWidget(
                  onItemClick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const BookingItemDetailsScreen()),
                    );
                  },
                  buttonText: isPast ? 'Review' : 'See detail',
                  itemTitle: 'Blue Vibe Room',
                  imgSrc:
                      'https://media.istockphoto.com/id/1837566278/photo/scandinavian-style-apartment-interior.jpg?s=2048x2048&w=is&k=20&c=ZT-ZoefdikBU9DhdEg4fV6bW-SdZi_HLRFg_mupNd9E=',
                  bookingDate: '12/12/2021',
                  bookingTime: '12:20 am',
                );
              },
              scrollDirection: Axis.vertical,

              itemCount: 10,
              // const PickedForYou(),
            ),
          ),
        ),
      ],
    );
  }
}
