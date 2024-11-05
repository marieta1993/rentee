import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final DateTime bookingFromTime;
  final DateTime bookingToTime;
  final int guestCount;
  final String paymentMethod;
  final String cardName;
  final String cardNumber;
  final String cardExpiry;
  final String cardCVV;
  final String roomId;
  final String userId;
  final int totalPrice;

  BookingModel({
    required this.totalPrice,
    required this.bookingFromTime,
    required this.bookingToTime,
    required this.guestCount,
    required this.paymentMethod,
    required this.cardName,
    required this.cardNumber,
    required this.cardExpiry,
    required this.cardCVV,
    required this.roomId,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookingFromTime': bookingFromTime,
      'bookingToTime': bookingToTime,
      'guestCount': guestCount,
      'paymentMethod': paymentMethod,
      'cardName': cardName,
      'cardNumber': cardNumber,
      'cardExpiry': cardExpiry,
      'cardCVV': cardCVV,
      'roomId': roomId,
      'userId': userId,
      'totalPrice': totalPrice,
    };
  }

  factory BookingModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return BookingModel(
      bookingFromTime: (data['bookingFromTime'] as Timestamp).toDate(),
      bookingToTime: (data['bookingToTime'] as Timestamp).toDate(),
      guestCount: data['guestCount'],
      paymentMethod: data['paymentMethod'],
      cardName: data['cardName'],
      cardNumber: data['cardNumber'],
      cardExpiry: data['cardExpiry'],
      cardCVV: data['cardCVV'],
      roomId: data['roomId'],
      userId: data['userId'],
      totalPrice: data['totalPrice'],
    );
  }
}
