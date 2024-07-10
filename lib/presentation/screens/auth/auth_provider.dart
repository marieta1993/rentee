import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController _fullNameController = TextEditingController();
  TextEditingController get fullNameController => _fullNameController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final TextEditingController _retypePassword = TextEditingController();

  TextEditingController get retypePassword => _retypePassword;

  final TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController get phoneNumberController => _phoneNumberController;

  final GlobalKey<FormState> _formSignUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formSignUpKey => _formSignUpKey;

  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formSignInKey => _formSignInKey;

  void reset() {
    _phoneNumberController.clear();
    _fullNameController.clear();
    _retypePassword.clear();
    _passwordController.clear();
  }

  void signUpAction() {
    debugPrint(_fullNameController.text);
    debugPrint(_phoneNumberController.text);
    debugPrint(_retypePassword.text);
    debugPrint(_passwordController.text);

    // Validate returns true if the form is valid, or false otherwise.
    if (_formSignUpKey.currentState!.validate()) {
      debugPrint("ola");
    }
  }

  void signInAction() {
    debugPrint(_phoneNumberController.text);
    debugPrint(_passwordController.text);

    // Validate returns true if the form is valid, or false otherwise.
    if (_formSignInKey.currentState!.validate()) {
      debugPrint("Sign in");
    }
  }
}
