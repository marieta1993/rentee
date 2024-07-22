import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rentee/data/models/room/room_model.dart';
import 'package:rentee/presentation/screens/home/main/home_tab/room_details/room_details_screen.dart';
import 'package:rentee/presentation/screens/home/main/location/location_handler.dart';

class RoomProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> allRoomsList() {
    Stream<QuerySnapshot> snapshotList =
        _firestore.collection('rooms').snapshots();
    return snapshotList;
  }

  Stream<QuerySnapshot> allRoomsWithSomeTypeList(String roomType) {
    Stream<QuerySnapshot> snapshotList = roomType != 'all'
        ? _firestore
            .collection('rooms')
            .where('roomType', isEqualTo: roomType)
            .snapshots()
        : _firestore.collection('rooms').snapshots();
    return snapshotList;
  }

  Stream<DocumentSnapshot> getRoomWithId(String id) {
    return _firestore.collection('rooms').doc(id).snapshots();
  }

  Future<String?> getRoomAddress(double lat, double long) async {
    try {
      String? address =
          await LocationHandler.getAddressOnlyFromLatLng(lat, long);
      return address ?? '';
    } catch (e) {
      return 'Error retrieving address';
    }
  }

  void onItemClick(BuildContext context, String roomId) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => RoomDetailsScreen(
                roomId: roomId,
              )),
    );
  }
}
