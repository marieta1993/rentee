import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
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
  const BookingSliderWidget({super.key});

  @override
  State<BookingSliderWidget> createState() => _BookingSliderWidgetState();
}

class _BookingSliderWidgetState extends State<BookingSliderWidget> {
  Container _buildContent() {
    return Container(
      padding: padding0,
      margin: paddingH32,
      child: CarouselSlider.builder(
        itemCount: imgList.length,
        options: CarouselOptions(
          height: 345,
          viewportFraction: 0.7,
          enlargeCenterPage: true,
          // padEnds: true,
        ),
        itemBuilder: (context, i, id) {
          //for onTap to redirect to another screen
          return Stack(fit: StackFit.expand, children: [
            Container(
              // width: MediaQuery.of(context).size.width,
              margin: padding0,
              //ClipRRect for image border radius
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderRadius: circularRadius15,
                child: Image.network(
                  imgList[i],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: paddingH20V25,
                decoration: BoxDecoration(
                  borderRadius: circularRadius12,
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
                        // RenteeAssets.icons.heart.svg(),
                        FavoriteButton(
                          isFavorite: false,
                          iconDisabledColor: Colors.transparent,
                          iconSize: 32.0,
                          iconColor: RenteeColors.secondary,
                          valueChanged: (_isFavorite) {},
                        ),
                      ],
                    ),
                    13.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: RenteeColors.white),
                              borderRadius: circularRadius10),
                          padding: paddingH14V6,
                          child: Text(
                            "\$12.50/1 hour",
                            style: notoP3.copyWith(
                                color: RenteeColors.additional5),
                          ),
                        ),
                        // RenteeAssets.icons.heart.svg(),
                        Text(
                          "District 1",
                          style:
                              notoH5.copyWith(color: RenteeColors.additional7),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: padding0,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
