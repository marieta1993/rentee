import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentee/presentation/screens/home/main/booking_provider.dart';
import 'package:rentee/presentation/screens/home/main/booking_tab/booking_item_details.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home/home_screen.dart';
import 'package:rentee/presentation/screens/home/tab_main_screen.dart';
import 'package:uikit/uikit.dart';

class BookingCompleteScreen extends StatelessWidget {
  const BookingCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: paddingH32,
            child: Consumer<BookingProvider>(builder: (context, provider, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RenteeAssets.images.bookingComplete.image(),
                  38.verticalSpacingRadius,
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 228,
                    ),
                    child: Text(
                      'Your booking has been completed!',
                      textAlign: TextAlign.center,
                      style: notoH1.copyWith(
                        color: RenteeColors.primary,
                      ),
                    ),
                  ),
                  10.verticalSpacingRadius,
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 203),
                    child: RichText(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'We will make your room ready at',
                            style: notoP2.copyWith(
                                color: RenteeColors.additional1),
                            children: [
                              TextSpan(
                                  text: " 12:00 am ",
                                  style: notoH4.copyWith(
                                    color: RenteeColors.additional1,
                                    fontWeight: FontWeight.w700,
                                  )),
                              TextSpan(
                                  text: " on ",
                                  style: notoP2.copyWith(
                                      color: RenteeColors.additional1)),
                              TextSpan(
                                  text: provider.bookingDateController.text,
                                  style: notoH4.copyWith(
                                    color: RenteeColors.additional1,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ])),
                  ),
                  38.verticalSpacingRadius,
                  Row(
                    children: [
                      Expanded(
                        child: RenteeElevatedButton(
                          text: "Back to home",
                          onPress: () {
                            provider.reset();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const TabMainScreen()),
                                (route) => false);
                          },
                        ),
                      ),
                      10.horizontalSpaceRadius,
                      Expanded(
                          child: RenteeElevatedButton.tertiary(
                        text: "See detail",
                        onPress: () {
                          provider.reset();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const BookingItemDetailsScreen()),
                              (route) => false);
                        },
                      )),
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
