import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentee/domain/models/room/room_model.dart';

class FirestoreCloudRepo {
  FirestoreCloudRepo._();
  static FirestoreCloudRepo? _instance;

  static FirestoreCloudRepo get instance {
    return _instance ?? FirestoreCloudRepo._();
  }

  FirebaseFirestore ffInstance = FirebaseFirestore.instance;

  // CollectionReference<RoomModel> get roomsRef =>
  //     ffInstance.collection('rooms').withConverter(
  //           fromFirestore: (data, _) => RoomModel.fromJson(data.data()!),
  //           toFirestore: (room, _) => room.toJson(),
  //         );

  // Stream<QuerySnapshot<RoomModel>> getRooms() {
  //   return roomsRef.snapshots();
  // }
  //
  // Stream<QuerySnapshot<RoomModel>> getAllRoomsWithSomeType(String roomType) {
  //   return roomType != 'all'
  //       ? roomsRef.where('roomType', isEqualTo: roomType).snapshots()
  //       : roomsRef.snapshots();
  // }
  //
  // addRoom(RoomModel newRoom) {
  //   roomsRef.add(newRoom);
  // }
}
