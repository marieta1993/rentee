import 'package:geolocator/geolocator.dart';

enum RoomCategory {
  stay,
  office,
}

enum PriceType { hourly, daily, weekly, monthly }

class BookingRoomDataModel {
  final String id;
  final String title;
  final Position? location;
  final double? price;
  final PriceType? priceType;
  final double? rating;
  final String? img;
  final String? description;
  final RoomCategory? category;

  const BookingRoomDataModel({
    required this.id,
    required this.title,
    this.price,
    this.priceType,
    this.rating,
    this.img,
    this.location,
    this.description,
    this.category,
  });
}
