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
}
