String? passwordValidator(value) {
  if (value.isEmpty) return "Please enter password";

  if (value.length <= 8) return "Password must contain at least 8 characters";

  return null;
}
