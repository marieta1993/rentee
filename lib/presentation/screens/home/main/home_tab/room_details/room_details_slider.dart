import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentee/domain/models/room/room_model.dart';
import 'package:rentee/presentation/screens/widgets/slider_item_widget.dart';
import 'package:uikit/uikit.dart';

class RoomDetailsSlider extends StatefulWidget {
  const RoomDetailsSlider({super.key, required this.room});
  final RoomModel room;

  @override
  State<RoomDetailsSlider> createState() => _RoomDetailsSliderState();
}

class _RoomDetailsSliderState extends State<RoomDetailsSlider> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: padding0,
          margin: paddingH15,
          child: CarouselSlider.builder(
            itemCount: widget.room.imgUrl.length,
            options: CarouselOptions(
              height: 493.sp,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (value, _) {
                _currentPage = value;
                if (mounted) {
                  setState(() {
                    _currentPage = value;
                  });
                }
              },
            ),
            itemBuilder: (context, index, id) {
              return SliderItemWidget(
                itemTitle: widget.room.title,
                itemPrice: double.parse(widget.room.price.toString()),
                itemBathCount: widget.room.bathCount,
                itemBedCount: widget.room.bedCount,
                itemRating: widget.room.rating,
                showAddressInSlider: false,
                imgSrc: widget.room.imgUrl.isNotEmpty
                    ? widget.room.imgUrl[index]
                    : '',
              );
            },
          ),
        ),
        13.heightBox,
        sliderDotIndicators(),
      ],
    );
  }

  sliderDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.room.imgUrl.length; i++)
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
    );
  }
}
