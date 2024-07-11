import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_details/check_out_screen.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:rentee/presentation/screens/widgets/card_room_item_widget.dart';
import 'package:rentee/presentation/screens/widgets/payment_method_widget.dart';
import 'package:uikit/uikit.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isCreditSelected = false;
  bool isTransferSelected = false;
  bool isPaypalSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingAppBarWidget(
        title: "Payment",
        onBackClick: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: ListView(
          padding: paddingAll32,
          children: [
            CardRoomItemWidget(
              cardColor: RenteeColors.additional6,
              itemTitle: 'Blaaa',
              itemPrice: 12.0,
              itemBathCount: 2,
              itemBedCount: 4,
              itemLocation: '1.2 km',
              itemRating: 5,
              imgSrc:
                  "https://images.unsplash.com/flagged/photo-1590227000970-3ae55d48501e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              onItemClick: () {},
            ),
            SizedBox(
                height: 1.sh,
                // width: 1.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      isThreeLine: false,
                      title: Padding(
                        padding: paddingB15,
                        child: Text(
                          'Booking detail',
                          style: notoH5.copyWith(
                            color: RenteeColors.additional2,
                          ),
                        ),
                      ),
                      minVerticalPadding: 20,
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Deposit',
                                style: notoH4.copyWith(
                                    color: RenteeColors.additional3),
                              ),
                              Text(
                                '\$12.50',
                                style: notoH3.copyWith(
                                    color: RenteeColors.additional1),
                              ),
                            ],
                          ),
                          21.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Booking time',
                                style: notoH4.copyWith(
                                    color: RenteeColors.additional3),
                              ),
                              Text(
                                '12:00 am',
                                style: notoH3.copyWith(
                                    color: RenteeColors.additional1),
                              ),
                            ],
                          ),
                          21.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Booking date',
                                style: notoH4.copyWith(
                                    color: RenteeColors.additional3),
                              ),
                              Text(
                                '12/12/2021',
                                style: notoH3.copyWith(
                                    color: RenteeColors.additional1),
                              ),
                            ],
                          ),
                          21.verticalSpace,
                        ],
                      ),
                    ),
                    ListTile(
                      contentPadding: padding0,
                      isThreeLine: false,
                      title: Padding(
                        padding: paddingB15,
                        child: Text(
                          'Payment method',
                          style: notoH5.copyWith(
                            color: RenteeColors.additional2,
                          ),
                        ),
                      ),
                      subtitle: paymentMethodsBuilder(),
                    ),
                    isCreditSelected
                        ? const Expanded(
                            child: Form(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  RenteeInputField(
                                    label: 'Card holder’s name',
                                    placeholder: 'Your card’s name here',
                                  ),
                                  RenteeInputField(
                                    label: 'Card number',
                                    placeholder: '1224 1232 **** ****',
                                  ),
                                  RenteeInputField(
                                    label: 'Expiration date',
                                    placeholder: '12/21',
                                  ),
                                  RenteeInputField(
                                    label: 'CVV',
                                    placeholder: '***',
                                  )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const CheckOutScreen()),
                                );
                              },
                              child: const Text('Complete your booking')),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  paymentMethodsBuilder() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        PaymentMethodWidget(
          title: "Credit card",
          icon: RenteeAssets.icons.creditCard,
          isSelected: isCreditSelected,
          itemOnClicked: () {
            setState(() {
              isCreditSelected = true;
              isPaypalSelected = false;
              isTransferSelected = false;
            });
          },
        ),
        PaymentMethodWidget(
          title: "Transfer",
          icon: RenteeAssets.icons.transfer,
          isSelected: isTransferSelected,
          itemOnClicked: () {
            setState(() {
              isCreditSelected = false;
              isPaypalSelected = false;
              isTransferSelected = true;
            });
          },
        ),
        PaymentMethodWidget(
          title: "PayPal",
          icon: RenteeAssets.icons.paypal,
          isSelected: isPaypalSelected,
          itemOnClicked: () {
            setState(() {
              isCreditSelected = false;
              isPaypalSelected = true;
              isTransferSelected = false;
            });
          },
        )
      ],
    );
  }
}
