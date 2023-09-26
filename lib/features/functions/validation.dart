enum ValidationError { invalid, valid }

ValidationError? validateEmail(String? value) {
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  print('email validation');
  return emailRegex.hasMatch(value ?? '') ? null : ValidationError.invalid;
}

ValidationError? validationPassword(String? value) {
  print('password validation');
  return (value ?? '').length < 8 ? ValidationError.invalid : null;
}
