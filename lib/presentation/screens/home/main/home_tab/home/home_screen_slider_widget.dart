import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentee/domain/models/room/room_model.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/presentation/screens/widgets/slider_item_widget.dart';
import 'package:uikit/uikit.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class BookingSliderWidget extends StatefulWidget {
  final String roomType;
  const BookingSliderWidget({super.key, required this.roomType});

  @override
  State<BookingSliderWidget> createState() => _BookingSliderWidgetState();
}

class _BookingSliderWidgetState extends State<BookingSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: context
            .read<RoomProvider>()
            .allRoomsWithSomeTypeList(widget.roomType),
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

          return Container(
            padding: padding0,
            margin: paddingH32,
            child: CarouselSlider.builder(
                itemCount: roomsList.length,
                options: CarouselOptions(
                  height: 345,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  pageSnapping: false,
                  // padEnds: true,
                ),
                itemBuilder: (context, index, id) {
                  RoomModel room = roomsList[index];
                  //for onTap to redirect to another screen

                  return FutureBuilder<String?>(
                      future: context.read<RoomProvider>().getRoomAddress(
                            room.address.latitude,
                            room.address.longitude,
                          ),
                      builder: (context, addressSnapshot) {
                        // if (addressSnapshot.connectionState ==
                        //     ConnectionState.waiting) {
                        //   return const Center(
                        //       child: CircularProgressIndicator());
                        // }

                        if (addressSnapshot.hasError) {
                          return Center(
                              child: Text('Error: ${addressSnapshot.error}'));
                        }

                        if (!addressSnapshot.hasData ||
                            addressSnapshot.data == null) {
                          return const Center(child: Text('No address'));
                        }
                        return SliderItemWidget(
                            itemTitle: room.title,
                            itemPrice: double.parse(room.price.toString()),
                            itemBathCount: room.bathCount,
                            itemBedCount: room.bedCount,
                            itemLocation: addressSnapshot.data!,
                            itemRating: room.rating,
                            imgSrc:
                                room.imgUrl.isNotEmpty ? room.imgUrl[0] : '',
                            onItemClick: () {
                              onItemClick(context, room.id);
                            });
                      });
                }),
          );
        });
  }

  void onItemClick(BuildContext context, String roomId) {
    context.read<RoomProvider>().onItemClick(context, roomId);
  }
}
