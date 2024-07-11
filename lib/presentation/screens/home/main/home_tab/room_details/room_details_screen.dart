import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_details/booking_room_screen.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:uikit/uikit.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class RoomDetailsScreen extends StatefulWidget {
  const RoomDetailsScreen({super.key});

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  int _currentPage = 0;
  bool _isFavorite = false;

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
            buildRoomImageCarousel(),
            Container(
              margin: paddingAll32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: notoH5.copyWith(color: RenteeColors.additional2),
                  ),
                  Text(
                    "Our fancy room with minimalism decoration will make you feel like home! We have an area for cooking and a cafe shop at ground floor. 24/7 security with our guards at front door will make you feel safe all the time.",
                    style: notoP2.copyWith(
                      color: RenteeColors.additional1,
                    ),
                  ),
                  25.heightBox,
                  Container(
                    height: 85,
                    decoration: BoxDecoration(
                      color: RenteeColors.additional1,
                      borderRadius: circularRadius20,
                    ),
                    child: Padding(
                      padding: paddingH16V12,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Padding(
                              padding: paddingAll16,
                              child: _isFavorite
                                  ? RenteeAssets.icons.unselectedSvg.svg(
                                      colorFilter: const ColorFilter.mode(
                                          RenteeColors.additional7,
                                          BlendMode.srcIn),
                                      width: 16,
                                      height: 16)
                                  : RenteeAssets.icons.selected.svg(
                                      colorFilter: const ColorFilter.mode(
                                          RenteeColors.secondary,
                                          BlendMode.srcIn),
                                      width: 16,
                                      height: 16),
                            ),
                            onTap: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                          ),
                          12.widthBox,
                          Expanded(
                            child: RenteeElevatedButton(
                              text: "Book now",
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const BookingRoomScreen()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }

  buildRoomImageCarousel() {
    return Container(
      decoration: BoxDecoration(
        color: RenteeColors.additional1,
        borderRadius: circularRadiusBL35BR35,
      ),
      child: Column(
        children: [
          Container(
            padding: padding0,
            margin: paddingH15,
            child: CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                  height: 493.sp,
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
                    borderRadius: circularRadius35,
                    child: Image.network(
                      imgList[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: paddingH20V25,
                        decoration: BoxDecoration(
                          borderRadius: circularRadius35,
                          color: Colors.black.withOpacity(0.2),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Slide $i",
                                  style: ptSerifH3.copyWith(
                                      color: RenteeColors.additional5),
                                ),
                              ],
                            ),
                            13.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: RenteeColors.white),
                                      borderRadius: circularRadius10),
                                  padding: paddingH14V6,
                                  child: Text(
                                    "\$12.50/1 hour",
                                    style: notoP3.copyWith(
                                        color: RenteeColors.additional5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]);
              },
            ),
          ),
          13.heightBox,
          buildCarouselIndicator(),
          Padding(
            padding: paddingH32V13,
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
            padding: paddingL32B32,
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
        for (int i = 0; i < imgList.length; i++)
          Container(
              margin: paddingAll5,
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
