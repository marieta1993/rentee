//
var emailRegExp =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";

mixin Validator {
  String? fullNameValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Can\'t be empty';
    }
    if (value.length < 4) {
      return 'Too short';
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value.isEmpty) return "Please enter password";

    if (value.length <= 8) return "Password must contain at least 8 characters";

    return null;
  }

  String? phoneNumberValidation(value) {
    String pattern = r'(^(?:[+][0-9])?[0-9]{10}$)';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid phone number';
    }
    return null;
  }

  String? minNumberValidation(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter number';
    }
    if (int.parse(value) < 1) {
      return 'Minimum guest count must be 1';
    }
    return null;
  }

  String? dateValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter date';
    }
    final date = DateTime.parse(value);
    if (date.isBefore(DateTime.now())) {
      return 'Please choose future date';
    }
    return null;
  }
}
