import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentee/domain/models/room/room_model.dart';
import 'package:rentee/presentation/screens/home/main/booking_provider.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_booking/booking_complete_screen.dart';
import 'package:rentee/presentation/screens/home/room_provider.dart';
import 'package:rentee/presentation/screens/widgets/booking_app_bar_widget.dart';
import 'package:rentee/presentation/screens/widgets/card_room_item_widget.dart';
import 'package:rentee/presentation/screens/widgets/payment_method_widget.dart';
import 'package:uikit/uikit.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.roomId});
  final String roomId;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isCreditSelected = false;
  bool isTransferSelected = false;
  bool isPaypalSelected = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: context.read<RoomProvider>().getRoomWithId(widget.roomId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('No data'));
          }

          RoomModel room = RoomModel.fromDocument(snapshot.data!);

          return Scaffold(
            appBar: BookingAppBarWidget(
              title: "Payment",
              onBackClick: () => Navigator.pop(context),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: paddingAll32,
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 88),
                  child: Consumer<BookingProvider>(
                      builder: (context, provider, _) {
                    var totalPrice = provider.calculateTotalPrice(room.price,
                        int.parse(provider.countOfDayController.text));
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            FutureBuilder(
                                future: context
                                    .read<RoomProvider>()
                                    .getRoomAddress(room.address.latitude,
                                        room.address.longitude),
                                builder: (context, address) {
                                  return CardRoomItemWidget(
                                    cardColor: RenteeColors.additional6,
                                    itemTitle: room.title,
                                    itemPrice:
                                        double.parse(room.price.toString()),
                                    itemBathCount: room.bathCount,
                                    itemBedCount: room.bedCount,
                                    itemLocation: address.data,
                                    itemRating: room.rating,
                                    imgSrc: room.imgUrl[0],
                                  );
                                }),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total price',
                                        style: notoH4.copyWith(
                                            color: RenteeColors.additional3),
                                      ),
                                      Text(
                                        '\$ $totalPrice',
                                        style: notoH3.copyWith(
                                            color: RenteeColors.additional1),
                                      ),
                                    ],
                                  ),
                                  21.verticalSpace,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Count of day',
                                        style: notoH4.copyWith(
                                            color: RenteeColors.additional3),
                                      ),
                                      Text(
                                        provider.countOfDayController.text,
                                        style: notoH3.copyWith(
                                            color: RenteeColors.additional1),
                                      ),
                                    ],
                                  ),
                                  21.verticalSpace,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Booking date',
                                        style: notoH4.copyWith(
                                            color: RenteeColors.additional3),
                                      ),
                                      Text(
                                        provider.bookingDateController.text,
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
                            // isCreditSelected
                            //     ? Form(
                            //         child: Column(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.stretch,
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.start,
                            //           mainAxisSize: MainAxisSize.max,
                            //           children: [
                            //             RenteeInputField(
                            //               label: 'Card holder’s name',
                            //               placeholder: 'Your card’s name here',
                            //             ),
                            //             RenteeInputField(
                            //               label: 'Card number',
                            //               placeholder: '1224 1232 **** ****',
                            //             ),
                            //             RenteeInputField(
                            //               label: 'Expiration date',
                            //               placeholder: '12/21',
                            //             ),
                            //             RenteeInputField(
                            //               label: 'CVV',
                            //               placeholder: '***',
                            //             )
                            //           ],
                            //         ),
                            //       )
                            //     : const SizedBox.shrink(),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {
                              provider.addBooking(
                                  roomId: room.id, price: room.price);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // builder: (_) => const CheckOutScreen()),
                                    builder: (_) =>
                                        const BookingCompleteScreen()),
                              );
                            },
                            child: const Text('Complete your booking'))
                      ],
                    );
                  }),
                ),
              ),
            ),
          );
        });
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
            // setState(() {
            //   isCreditSelected = true;
            //   isPaypalSelected = false;
            //   isTransferSelected = false;
            // });
          },
        ),
        PaymentMethodWidget(
          title: "Transfer",
          icon: RenteeAssets.icons.transfer,
          isSelected: isTransferSelected,
          itemOnClicked: () {
            // setState(() {
            //   isCreditSelected = false;
            //   isPaypalSelected = false;
            //   isTransferSelected = true;
            // });
          },
        ),
        PaymentMethodWidget(
          title: "PayPal",
          icon: RenteeAssets.icons.paypal,
          isSelected: isPaypalSelected,
          itemOnClicked: () {
            // setState(() {
            //   isCreditSelected = false;
            //   isPaypalSelected = true;
            //   isTransferSelected = false;
            // });
          },
        )
      ],
    );
  }
}
