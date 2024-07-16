import 'package:rentee/data/models/booking_data/booking_room_model.dart';

enum BillingMethod { credit, transit, paypal }

class BookingDetailDataModel {
  final String id;
  final BookingRoomDataModel bookedRoom;
  final double deposit;
  final DateTime time;
  final DateTime date;
  final BillingMethod method;

  const BookingDetailDataModel({
    required this.id,
    required this.bookedRoom,
    required this.deposit,
    required this.time,
    required this.date,
    required this.method,
  });
}
