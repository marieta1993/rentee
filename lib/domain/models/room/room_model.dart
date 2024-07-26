import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'room_model.g.dart';
//
// @JsonSerializable()
class RoomModel {
  final String id;
  final Location address;
  final int bathCount;
  final int bedCount;
  final String description;
  final List<String> imgUrl;
  final int price;
  final int rating;
  final String roomType;
  final String title;

  RoomModel({
    required this.id,
    required this.address,
    required this.bathCount,
    required this.bedCount,
    required this.description,
    required this.imgUrl,
    required this.price,
    required this.rating,
    required this.roomType,
    required this.title,
  });

  factory RoomModel.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return RoomModel(
      id: doc.id,
      address: Location.fromGeoPoint(data['address']),
      bathCount: data['bathCount'],
      bedCount: data['bedCount'],
      description: data['description'],
      imgUrl: List<String>.from(data['imgUrl']),
      price: data['price'],
      rating: data['rating'],
      roomType: data['roomType'],
      title: data['title'],
    );
  }

  // factory RoomModel.fromJson(Map<String, dynamic> json) {
  //   return RoomModel(
  //     address: Location.fromGeoPoint(json['address']),
  //     bathCount: json['bathCount'],
  //     bedCount: json['bedCount'],
  //     description: json['description'],
  //     imgUrl: List<String>.from(json['imgUrl']),
  //     price: json['price'],
  //     rating: json['rating'],
  //     roomType: json['roomType'],
  //     title: json['title'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     "address": address,
  //     "bathCount": bathCount,
  //     "bedCount": bedCount,
  //     "description": description,
  //     "imgUrl": imgUrl,
  //     "price": price,
  //     "rating": rating,
  //     "roomType": roomType,
  //     "title": title,
  //   };
  // }
}

// @JsonSerializable()
class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });
  factory Location.fromGeoPoint(GeoPoint geoPoint) {
    return Location(
      latitude: geoPoint.latitude,
      longitude: geoPoint.longitude,
    );
  }
}
