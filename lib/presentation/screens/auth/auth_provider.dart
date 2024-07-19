import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCustomProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool exists = false;

  final TextEditingController _firstNameController = TextEditingController();
  TextEditingController get firstNameController => _firstNameController;

  final TextEditingController _lastNameController = TextEditingController();
  TextEditingController get lastNameController => _lastNameController;

  final TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController get phoneNumberController => _phoneNumberController;

  final TextEditingController _otpCodeController = TextEditingController();

  TextEditingController get otpCodeController => _otpCodeController;

  // form keys
  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formSignUpKey => _formSignUpKey;

  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formSignInKey => _formSignInKey;

  final GlobalKey<FormState> _formVerifyKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formVerifyKey => _formVerifyKey;

  void reset() {
    _phoneNumberController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _otpCodeController.clear();
  }

  signInAction() {
    // Validate returns true if the form is valid, or false otherwise.
    return _formSignInKey.currentState!.validate();
    debugPrint("Sign in");
  }

  Future<bool> checkPhoneNumberExists() async {
    User? user = _auth.currentUser;
    final querySnapshot = await _firestore
        .collection('users')
        .where('phone', isEqualTo: user?.phoneNumber)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  saveUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set({
            'firstName': _firstNameController.text,
            'lastName': _lastNameController.text,
            'phone': user.phoneNumber,
          })
          .then((value) {})
          .onError((error, stackTrace) {});
    }
  }

  loadUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return userDoc['firstName'] + ' ' + userDoc['lastName'];
      }
    }
  }

  Future logout() async {
    await _auth.signOut();
    reset();
  }
}
