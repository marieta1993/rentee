import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentee/data/models/room/room_model.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_details/booking_room_screen.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:rentee/presentation/screens/widgets/slider_item_widget.dart';
import 'package:uikit/uikit.dart';

class RoomDetailsScreen extends StatefulWidget {
  const RoomDetailsScreen({
    super.key,
    required this.roomId,
  });

  final String roomId;

  @override
  State<RoomDetailsScreen> createState() => _RoomDetailsScreenState();
}

class _RoomDetailsScreenState extends State<RoomDetailsScreen> {
  int _currentPage = 0;
  bool _isFavorite = false;

  Stream<DocumentSnapshot> getRoomWithId(String id) {
    return context.read<RoomProvider>().getRoomWithId(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBarWidget(
        hasShape: false,
        title: "Room",
        onBackClick: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
          stream: getRoomWithId(widget.roomId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text('No data available'));
            }

            RoomModel room = RoomModel.fromDocument(snapshot.data!);

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
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
                            itemCount: room.imgUrl.length,
                            options: CarouselOptions(
                              height: 493.sp,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              onPageChanged: (value, _) {
                                _currentPage = value;
                              },
                            ),
                            itemBuilder: (context, index, id) {
                              return FutureBuilder<String?>(
                                  future: context
                                      .read<RoomProvider>()
                                      .getRoomAddress(
                                        room.address.latitude,
                                        room.address.longitude,
                                      ),
                                  builder: (context, addressSnapshot) {
                                    if (addressSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }

                                    if (addressSnapshot.hasError) {
                                      return Center(
                                          child: Text(
                                              'Error: ${addressSnapshot.error}'));
                                    }

                                    if (!addressSnapshot.hasData ||
                                        addressSnapshot.data == null) {
                                      return const Center(
                                          child: Text('No address'));
                                    }
                                    return SliderItemWidget(
                                      itemTitle: room.title,
                                      itemPrice:
                                          double.parse(room.price.toString()),
                                      itemBathCount: room.bathCount,
                                      itemBedCount: room.bedCount,
                                      itemRating: room.rating,
                                      showAddressInSlider: false,
                                      imgSrc: room.imgUrl.isNotEmpty
                                          ? room.imgUrl[index]
                                          : '',
                                    );
                                  });
                            },
                          ),
                        ),
                        13.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < room.imgUrl.length; i++)
                              Container(
                                margin: paddingAll5,
                                height: i == _currentPage ? 10 : 8,
                                width: i == _currentPage ? 10 : 8,
                                decoration: BoxDecoration(
                                  color: i == _currentPage
                                      ? RenteeColors.primary
                                      : RenteeColors.additional3,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: paddingH32V13,
                          child: Row(
                            children: [
                              RenteeAssets.icons.locate.svg(
                                colorFilter: const ColorFilter.mode(
                                  RenteeColors.additional3,
                                  BlendMode.srcIn,
                                ),
                                width: 16,
                                height: 16,
                              ),
                              SizedBox(
                                width: 2.sp,
                              ),
                              Flexible(
                                child: Text(
                                  "room.address.street,", // Display the address here
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: notoP2.copyWith(
                                      color: RenteeColors.additional7),
                                ),
                              ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RenteeAssets.icons.bedroom.svg(
                                        colorFilter: const ColorFilter.mode(
                                          RenteeColors.additional3,
                                          BlendMode.srcIn,
                                        ),
                                        width: 16,
                                        height: 16,
                                      ),
                                      Text(
                                        room.bedCount.toString(),
                                        style: notoP2.copyWith(
                                          color: RenteeColors.additional7,
                                        ),
                                      ),
                                    ],
                                  ),
                                  37.widthBox,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RenteeAssets.icons.bathroom.svg(
                                        colorFilter: const ColorFilter.mode(
                                          RenteeColors.additional3,
                                          BlendMode.srcIn,
                                        ),
                                        width: 16,
                                        height: 16,
                                      ),
                                      Text(
                                        room.bathCount.toString(),
                                        style: notoP2.copyWith(
                                          color: RenteeColors.additional7,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: paddingAll32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style:
                              notoH5.copyWith(color: RenteeColors.additional2),
                        ),
                        Text(
                          room.description,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
