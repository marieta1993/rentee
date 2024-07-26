import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home/home_screen_slider_widget.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home/near_to_you_widget.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/home/picked_for_you_widget.dart';
import 'package:uikit/uikit.dart';

class HomeScreenTabMain extends StatefulWidget {
  const HomeScreenTabMain({super.key});

  @override
  State<HomeScreenTabMain> createState() => _HomeScreenTabMainState();
}

class _HomeScreenTabMainState extends State<HomeScreenTabMain> {
  int _sliding = 0;
  final Color thumbTextColor = RenteeColors.additional3;
  final _children = const {
    0: Text("All", style: TextStyle(color: RenteeColors.additional3)),
    1: Text("Stay", style: TextStyle(color: RenteeColors.additional3)),
    2: Text("Office", style: TextStyle(color: RenteeColors.additional3)),
  };

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: paddingV8H32,
        child: CustomSlidingSegmentedControl<int>(
          // controller: controller,
          padding: 32,
          isStretch: true,
          initialValue: _sliding,
          height: 48,
          children: _children,
          decoration: BoxDecoration(
            color: RenteeColors.additional5,
            borderRadius: circularRadius15,
          ),
          thumbDecoration: BoxDecoration(
            color: RenteeColors.primary,
            borderRadius: circularRadius15,
          ),

          onValueChanged: (v) {
            setState(() {
              _sliding = v;
            });
          },
        ),
      ),
      _sliding == 0
          ? const BookingSliderWidget(roomType: 'all')
          : const SizedBox.shrink(),
      _sliding == 1
          ? const BookingSliderWidget(roomType: 'stay')
          : const SizedBox.shrink(),
      _sliding == 2
          ? const BookingSliderWidget(roomType: 'office')
          : const SizedBox.shrink(),
      const PickedForYou(),
      const NearToYou(),
    ]);
  }
}
