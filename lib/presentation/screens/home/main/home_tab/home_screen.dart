import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home_screen_tab_main.dart';
import 'package:uikit/uikit.dart';

import '../location/location_handler.dart';

class SearchToolBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchToolBar({super.key});

  @override
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
          // SizedBox(
          //   width: 14.sp,
          // ),
          // RenteeIconButton.filled(
          //   onPress: () {},
          //   icon: Padding(
          //     padding: REdgeInsetsDirectional.all(4),
          //     child: RenteeAssets.icons.group1.svg(
          //       width: 24,
          //       height: 24,
          //       colorFilter:
          //           const ColorFilter.mode(RenteeColors.white, BlendMode.srcIn),
          //     ),
          //   ),
          // )
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
            padding: paddingT8,
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
        shape: RoundedRectangleBorder(borderRadius: circularRadiusB25),
        backgroundColor: RenteeColors.additional1,
      ),
      body: const HomeScreenTabMain(),
      // PickedForYou(),
    );
  }
}