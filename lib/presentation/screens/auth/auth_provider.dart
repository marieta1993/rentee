import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCustomProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _firstNameController = TextEditingController();
  TextEditingController get firstNameController => _firstNameController;

  final TextEditingController _lastNameController = TextEditingController();
  TextEditingController get lastNameController => _lastNameController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final TextEditingController _retypePassword = TextEditingController();

  TextEditingController get retypePassword => _retypePassword;

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
    _retypePassword.clear();
    _passwordController.clear();
  }

  void signUpAction() {
    debugPrint(_firstNameController.text);
    debugPrint(_phoneNumberController.text);
    debugPrint(_retypePassword.text);
    debugPrint(_passwordController.text);

    // Validate returns true if the form is valid, or false otherwise.
    if (_formSignUpKey.currentState!.validate()) {
      debugPrint("ola");
    }
  }

  signInAction() {
    debugPrint(_phoneNumberController.text);
    debugPrint(_passwordController.text);

    // Validate returns true if the form is valid, or false otherwise.
    return _formSignInKey.currentState!.validate();
    debugPrint("Sign in");
  }

  saveUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'name': _firstNameController.text,
        'surname': _lastNameController.text,
        'phone': user.phoneNumber,
      }).then((value) {
        print("olaaaaaaaaaaaaaaaaaaaaaa");
      }).onError((error, stackTrace) {});
    }
  }

  loadUserDetails() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();
      if (userDoc.exists) {
        return userDoc['name'] + ' ' + userDoc['surname'];
      }
    }
  }
}
