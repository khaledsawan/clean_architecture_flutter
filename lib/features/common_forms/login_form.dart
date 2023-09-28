import 'dart:io';
import 'package:mime/mime.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid, short }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 8) return PasswordValidationError.short;
    return null;
  }
}

enum EmailValidationError { empty, invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegex.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

enum FileImageValidationError { empty, invalid }

class FileImage extends FormzInput<File?, FileImageValidationError> {
  const FileImage.pure() : super.pure(null);
  const FileImage.dirty([File? value]) : super.dirty(value);

  @override
  FileImageValidationError? validator(File? value) {
    if (value == null || value.path.isEmpty) {
      return FileImageValidationError.empty;
    }

    final mimeType = lookupMimeType(value.path);
    if (mimeType != null && mimeType.startsWith('image')) {
      return null;
    } else {
      return FileImageValidationError.invalid;
    }
  }
}
