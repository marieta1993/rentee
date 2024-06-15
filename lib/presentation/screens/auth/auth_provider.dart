import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController _fullNameController = TextEditingController();
  TextEditingController get fullNameController => _fullNameController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final TextEditingController _retypePassword = TextEditingController();

  TextEditingController get retypePassword => _retypePassword;

  final TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController get phoneNumberController => _phoneNumberController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

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
  }
}
