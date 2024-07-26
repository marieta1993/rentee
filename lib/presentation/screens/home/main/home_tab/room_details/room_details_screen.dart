import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentee/domain/models/room/room_model.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_booking/booking_room_screen.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_details/room_details_slider.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
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
                        RoomDetailsSlider(room: room),
                        roomDetailsAddressBar(room),
                        roomDetailsAdditional(room)
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
                        actionButtons(room),
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

  roomDetailsAddressBar(RoomModel room) {
    return Padding(
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
          FutureBuilder(
              future: context.read<RoomProvider>().getRoomFullAddress(
                  room.address.latitude, room.address.longitude),
              builder: (context, address) {
                if (address.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (address.hasError) {
                  return Center(child: Text('Error: ${address.error}'));
                }

                if (!address.hasData || address.data == null) {
                  return const Center(child: Text('No address'));
                }

                return Flexible(
                  child: Text(
                    address.data ?? '', // Display the address here
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: notoP2.copyWith(color: RenteeColors.additional7),
                  ),
                );
              }),
        ],
      ),
    );
  }

  roomDetailsAdditional(RoomModel room) {
    return Padding(
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }

  actionButtons(RoomModel room) {
    return Container(
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
            // InkWell(
            //   child: Padding(
            //     padding: paddingAll16,
            //     child: _isFavorite
            //         ? RenteeAssets.icons.unselectedSvg.svg(
            //             colorFilter: const ColorFilter.mode(
            //                 RenteeColors.additional7, BlendMode.srcIn),
            //             width: 16,
            //             height: 16)
            //         : RenteeAssets.icons.selected.svg(
            //             colorFilter: const ColorFilter.mode(
            //                 RenteeColors.secondary, BlendMode.srcIn),
            //             width: 16,
            //             height: 16),
            //   ),
            //   onTap: () {
            //     setState(() {
            //       _isFavorite = !_isFavorite;
            //     });
            //   },
            // ),
            // 12.widthBox,
            Expanded(
              child: RenteeElevatedButton(
                text: "Book now",
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BookingRoomScreen(
                              roomId: room.id,
                            )),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
