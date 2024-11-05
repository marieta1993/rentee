import 'package:carousel_slider/carousel_slider.dart' as carousel_slider;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentee/domain/models/booking_data/booking_model.dart';
import 'package:rentee/domain/models/room/room_model.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:rentee/utils/extensions/date.dart';
import 'package:uikit/uikit.dart';

// final List<String> imgList = [
//   'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
//   'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
//   'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
//   'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
//   'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
// ];

class BookedItemDetailsScreen extends StatefulWidget {
  const BookedItemDetailsScreen({
    super.key,
    required this.booking,
    required this.room,
  });
  final BookingModel booking;
  final RoomModel room;

  @override
  State<BookedItemDetailsScreen> createState() =>
      _BookedItemDetailsScreenState();
}

class _BookedItemDetailsScreenState extends State<BookedItemDetailsScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BookingAppBarWidget(
          hasShape: false,
          title: "Room",
          onBackClick: () => Navigator.pop(context),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            buildBookingItemImageCarousel(),
            Container(
              height: 0.7.sh,
              margin: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    isThreeLine: false,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        'Booking detail',
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
                              'Total Price',
                              style: notoH4.copyWith(
                                  color: RenteeColors.additional3),
                            ),
                            Text(
                              '\$ ${widget.booking.totalPrice}',
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
                              'Booking from date',
                              style: notoH4.copyWith(
                                  color: RenteeColors.additional3),
                            ),
                            Text(
                              widget.booking.bookingFromTime.shortDate,
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
                              'Booking to date',
                              style: notoH4.copyWith(
                                  color: RenteeColors.additional3),
                            ),
                            Text(
                              widget.booking.bookingToTime.shortDate,
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
                              'Method',
                              style: notoH4.copyWith(
                                  color: RenteeColors.additional3),
                            ),
                            Text(
                              'Credit card',
                              style: notoH3.copyWith(
                                  color: RenteeColors.additional1),
                            ),
                          ],
                        ),
                        21.verticalSpace,
                      ],
                    ),
                  ),
                  Text(
                    "Description",
                    style: notoH5.copyWith(color: RenteeColors.additional2),
                  ),
                  Text(
                    widget.room.description,
                    style: notoP2.copyWith(
                      color: RenteeColors.additional1,
                    ),
                  ),
                  25.heightBox,
                  // Row(
                  //   mainAxisSize: MainAxisSize.max,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: RenteeElevatedButton.gray(
                  //         text: "Cancel booking",
                  //         onPress: () {},
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        )));
  }

  buildBookingItemImageCarousel() {
    return Container(
      decoration: const BoxDecoration(
        color: RenteeColors.additional1,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: carousel_slider.CarouselSlider.builder(
              itemCount: widget.room.imgUrl.length,
              options: carousel_slider.CarouselOptions(
                  height: 226.sp,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
              itemBuilder: (context, i, id) {
                //for onTap to redirect to another screen
                return Stack(fit: StackFit.expand, children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    borderRadius: BorderRadius.circular(35),
                    child: Image.network(
                      widget.room.imgUrl[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.black.withOpacity(0.2),
                        )),
                  ),
                ]);
              },
            ),
          ),
          13.heightBox,
          buildCarouselIndicator(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 13.0),
            child: Row(
              children: [
                RenteeAssets.icons.locate.svg(
                    colorFilter: const ColorFilter.mode(
                        RenteeColors.additional3, BlendMode.srcIn),
                    width: 16,
                    height: 16),
                SizedBox(
                  width: 2.sp,
                ),
                Flexible(
                  child: Text(
                    "Room Address",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: notoP2.copyWith(color: RenteeColors.additional7),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, bottom: 32.0),
            child: Row(
              children: [
                Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RenteeAssets.icons.bedroom.svg(
                              colorFilter: const ColorFilter.mode(
                                  RenteeColors.additional3, BlendMode.srcIn),
                              width: 16,
                              height: 16),
                          Text('1',
                              style: notoP2.copyWith(
                                  color: RenteeColors.additional7)),
                        ],
                      ),
                      37.widthBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RenteeAssets.icons.bathroom.svg(
                              colorFilter: const ColorFilter.mode(
                                  RenteeColors.additional3, BlendMode.srcIn),
                              width: 16,
                              height: 16),
                          Text(
                            '1',
                            style: notoP2.copyWith(
                                color: RenteeColors.additional7),
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.room.imgUrl.length; i++)
          Container(
              margin: const EdgeInsets.all(5),
              height: i == _currentPage ? 10 : 8,
              width: i == _currentPage ? 10 : 8,
              decoration: BoxDecoration(
                  color: i == _currentPage
                      ? RenteeColors.primary
                      : RenteeColors.additional3,
                  shape: BoxShape.circle)),
      ],
    );
  }
}
