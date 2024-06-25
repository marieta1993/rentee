String? confirmPasswordValidator(value, {String? other}) {
  if (value.isEmpty) return 'Please enter confirm password.';
  if (value != value) {
    return 'Confirm password is not match with password.';
  }
  return null;
}
