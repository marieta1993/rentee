import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uikit/uikit.dart';

import '../location/Location_handler.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class SearchToolBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchToolBar({super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(88);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: RenteeInputField(
            placeholder: ("Looking for room"),
            icon: RenteeAssets.icons.search.svg(),
          )),
          SizedBox(
            width: 14.sp,
          ),
          RenteeIconButton.filled(
            onPress: () {},
            icon: Padding(
              padding: REdgeInsetsDirectional.all(4),
              child: RenteeAssets.icons.group1.svg(
                width: 24,
                height: 24,
                colorFilter:
                    const ColorFilter.mode(RenteeColors.white, BlendMode.srcIn),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? _currentPosition;
  String? _currentAddress;

  @override
  initState() {
    super.initState();
    getCurrentAddress();
  }

  getCurrentAddress() async {
    _currentPosition = await LocationHandler.getCurrentPosition();
    _currentAddress =
        (await LocationHandler.getAddressFromLatLng(_currentPosition!))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        title: ListTile(
          isThreeLine: true,
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Hello I am title",
            style: notoP2.copyWith(color: RenteeColors.additional5),
          ),
          trailing: const CircleAvatar(),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                RenteeAssets.icons.locate.svg(
                    colorFilter: const ColorFilter.mode(
                        RenteeColors.additional5, BlendMode.srcIn),
                    width: 24,
                    height: 24),
                SizedBox(
                  width: 10.sp,
                ),
                Flexible(
                  child: Text(
                    _currentAddress ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: notoH2.copyWith(color: RenteeColors.additional5),
                  ),
                )
              ],
            ),
          ),
        ),
        bottom: const SearchToolBar(),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        backgroundColor: RenteeColors.additional1,
      ),
      body: _buildContent(),
    );
  }

  Container _buildContent() {
    return Container(
      margin: const EdgeInsets.all(32),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.7,
              ),
              items: imgList
                  .map(
                    (item) => Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                  )
                  .toList(),
            ),
            Text(
              'Portfolio',
              style: TextStyle(fontSize: 50.sp, color: Colors.lime),
            )
          ]),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            margin: EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      child: Text(
                        'No. ${imgList.indexOf(item)} image',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
      .toList();
}
