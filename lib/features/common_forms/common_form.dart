import 'dart:io';

import 'package:formz/formz.dart';
import 'package:mime/mime.dart';

enum PasswordValidationError {
  empty,
  invalid,
  short,
  noUpperCase,
  noLowerCase,
  noDigit
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 8) return PasswordValidationError.short;

    if (!value.contains(RegExp(r'[A-Z]')))
      return PasswordValidationError.noUpperCase;
    if (!value.contains(RegExp(r'[a-z]')))
      return PasswordValidationError.noLowerCase;
    if (!value.contains(RegExp(r'[0-9]')))
      return PasswordValidationError.noDigit;

    return null;
  }
}

enum EmailValidationError { empty, invalid, noDomain }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (value.contains('@example.com')) return EmailValidationError.noDomain;
    if (!_emailRegex.hasMatch(value)) return EmailValidationError.invalid;
    return null;
  }
}

enum FileImageValidationError { empty, invalid, tooLarge }

class FileImage extends FormzInput<File?, FileImageValidationError> {
  const FileImage.pure() : super.pure(null);
  const FileImage.dirty([File? value]) : super.dirty(value);

  @override
  FileImageValidationError? validator(File? value) {
    if (value == null) return FileImageValidationError.empty;
    final mimeType = lookupMimeType(value.path);

    if (mimeType != null && mimeType.startsWith('image')) {
      // Additional validation for image size (e.g., 5MB limit)
      if (value.lengthSync() > 5 * 1024 * 1024)
        return FileImageValidationError.tooLarge;
      return null;
    } else {
      return FileImageValidationError.invalid;
    }
  }
}
