import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentee/domain/models/room/room_model.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/presentation/screens/widgets/card_big_room_item.dart';
import 'package:uikit/uikit.dart';

class PickedForYou extends StatelessWidget {
  const PickedForYou({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: context.read<RoomProvider>().allRoomsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data'));
          }

          List<RoomModel> roomsList = snapshot.data!.docs.map((doc) {
            return RoomModel.fromDocument(doc);
          }).toList();

          return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: paddingH32V20,
                  child: Text(
                    "Picked for you",
                    textAlign: TextAlign.left,
                    style: notoH3.copyWith(
                      color: RenteeColors.additional1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                    margin: paddingL24,
                    height: 285.sp,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        RoomModel room = roomsList[index];

                        return FutureBuilder<String?>(
                            future: context.read<RoomProvider>().getRoomAddress(
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
                                return const Center(child: Text('No address'));
                              }
                              return CardBigRoomItem(
                                  itemTitle: room.title,
                                  itemPrice:
                                      double.parse(room.price.toString()),
                                  itemBathCount: room.bathCount,
                                  itemBedCount: room.bedCount,
                                  itemLocation: addressSnapshot.data!,
                                  itemRating: room.rating,
                                  imgSrc: room.imgUrl.isNotEmpty
                                      ? room.imgUrl[0]
                                      : '',
                                  onItemClick: () {
                                    onItemClick(context, room.id);
                                  });
                            });
                      },
                      padding: paddingAll8,
                      scrollDirection: Axis.horizontal,
                      itemCount: roomsList.length,
                    )),
              ]);
        });
  }

  void onItemClick(BuildContext context, String roomId) {
    context.read<RoomProvider>().onItemClick(context, roomId);
  }
}
