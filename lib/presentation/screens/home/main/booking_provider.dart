import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentee/domain/models/booking_data/booking_model.dart';

class BookingProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _bookingTimeController = TextEditingController();
  TextEditingController get bookingTimeController => _bookingTimeController;

  final TextEditingController _bookingDateController = TextEditingController();
  TextEditingController get bookingDateController => _bookingDateController;

  final TextEditingController _numOfGuestController = TextEditingController();
  TextEditingController get numOfGuestController => _numOfGuestController;

  final TextEditingController _countOfDayController = TextEditingController();
  TextEditingController get countOfDayController => _countOfDayController;

  final TextEditingController _paymentController = TextEditingController();
  TextEditingController get paymentController => _paymentController;

  final TextEditingController _totalPriceController = TextEditingController();
  TextEditingController get totalPriceController => _totalPriceController;

  final TextEditingController _cardNameController = TextEditingController();
  TextEditingController get cardNameController => _cardNameController;

  final TextEditingController _cardNumberController = TextEditingController();
  TextEditingController get cardNumberController => _cardNumberController;

  final TextEditingController _cardExpiryController = TextEditingController();
  TextEditingController get cardExpiryController => _cardExpiryController;

  final TextEditingController _cardCVVController = TextEditingController();
  TextEditingController get cardCVVController => _cardCVVController;

  // form keys
  final GlobalKey<FormState> _formBookingKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formBookingKey => _formBookingKey;

  void reset() {
    _bookingDateController.clear();
    _bookingTimeController.clear();
    _countOfDayController.clear();
    _numOfGuestController.clear();
    _paymentController.clear();
    _cardCVVController.clear();
    _cardNameController.clear();
    _cardExpiryController.clear();
    _cardNumberController.clear();
  }

  // saveBookingDetails() async {
  //   User? user = _auth.currentUser;
  //   if (user != null) {
  //     await _firestore
  //         .collection('bookings')
  //         .doc(user.uid)
  //         .set({
  //           'firstName': _firstNameController.text,
  //           'lastName': _lastNameController.text,
  //           'phone': user.phoneNumber,
  //         })
  //         .then((value) {})
  //         .onError((error, stackTrace) {});
  //   }
  // }

  Future<void> addBooking({
    required String roomId,
    required int price,
  }) async {
    CollectionReference bookings = _firestore.collection('bookings');

    DateTime bookingFromTime = DateTime.parse("${bookingDateController.text}");
    DateTime bookingToTime = bookingFromTime
        .add(Duration(days: int.parse(_countOfDayController.text)));

    BookingModel newBooking = BookingModel(
        userId: _auth.currentUser!.uid,
        bookingFromTime: bookingFromTime,
        bookingToTime: bookingToTime,
        guestCount: int.parse(_numOfGuestController.text),
        paymentMethod: 'credit',
        cardName: _cardNameController.text,
        cardNumber: _cardNumberController.text,
        cardExpiry: _cardExpiryController.text,
        cardCVV: _cardCVVController.text,
        roomId: roomId,
        totalPrice: price * int.parse(_countOfDayController.text));

    return bookings
        .add(newBooking.toMap())
        .then((value) => print("Booking Added"))
        .catchError((error) => print("Failed to add booking: $error"));
  }

  calculateTotalPrice(int price, int countOfDay) {
    // Implement your logic to calculate total price
    // This is a placeholder
    return price * countOfDay;
  }

  Stream<QuerySnapshot> allBookingsList(bool isOngoing) {
    final Timestamp now = Timestamp.now();
    Stream<QuerySnapshot> snapshotList;

    if (isOngoing) {
      print("isOngoing");
      snapshotList = _firestore
          .collection('bookings')
          .where('userId', isEqualTo: _auth.currentUser!.uid)
          .where('bookingFromTime', isLessThan: now)
          .snapshots();
    } else {
      print("isPast");

      snapshotList = _firestore
          .collection('bookings')
          .where('userId', isEqualTo: _auth.currentUser!.uid)
          .where('bookingFromTime', isGreaterThanOrEqualTo: now)
          .snapshots();
    }
    return snapshotList;
  }

  Future<void> selectBookingDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      bookingDateController.text = "${picked.toLocal()}".split(' ')[0];
      notifyListeners();
    }
  }

  Stream<DocumentSnapshot> getBookingWithId(String id) {
    return _firestore.collection('bookings').doc(id).snapshots();
  }
}
