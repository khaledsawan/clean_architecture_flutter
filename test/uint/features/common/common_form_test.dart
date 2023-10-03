import 'dart:io';

import 'package:clean_architecture_flutter/features/common_forms/common_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Password Validation', () {
    test('Empty password returns error', () {
      final password = Password.dirty('');
      expect(password.error, PasswordValidationError.empty);
    });

    test('Short password returns error', () {
      final password = Password.dirty('Ab1');
      expect(password.error, PasswordValidationError.short);
    });

    test('Password without uppercase letter returns error', () {
      final password = Password.dirty('test1234');
      expect(password.error, PasswordValidationError.noUpperCase);
    });

    test('Password without lowercase letter returns error', () {
      final password = Password.dirty('TEST1234');
      expect(password.error, PasswordValidationError.noLowerCase);
    });

    test('Password without a digit returns error', () {
      final password = Password.dirty('TestPassword');
      expect(password.error, PasswordValidationError.noDigit);
    });

    test('Valid password returns null', () {
      final password = Password.dirty('Test1234');
      expect(password.error, isNull);
    });
  });

  group('Email Validation', () {
    test('Empty email returns error', () {
      final email = Email.dirty('');
      expect(email.error, EmailValidationError.empty);
    });

    test('Invalid email returns error', () {
      final email = Email.dirty('invalid-email');
      expect(email.error, EmailValidationError.invalid);
    });

    test('Email without @example.com returns error', () {
      final email = Email.dirty('user@example.org');
      expect(email.error, null);
    });
    test('Email without @example.com returns error', () {
      final email = Email.dirty('user@example.com');
      expect(email.error, EmailValidationError.noDomain);
    });

    test('Valid email returns null', () {
      final email = Email.dirty('user@gmail.com');
      expect(email.error, null);
    });
  });

  group('FileImage Validation', () {
    test('Empty file returns error', () {
      final fileImage = FileImage.dirty(null);
      expect(fileImage.error, FileImageValidationError.empty);
    });

    test('Non-image file returns error', () {
      final fileImage = FileImage.dirty(File('non_image.txt'));
      expect(fileImage.error, FileImageValidationError.invalid);
    });

    test('Large image file returns error', () {
      final largeImageFile = File('assets/image.png');
      // Assume the file is larger than 5MB (limit)
      final fileImage = FileImage.dirty(largeImageFile);
      expect(fileImage.error, FileImageValidationError.tooLarge);
    });

    test('Valid image file returns null', () {
      final imageFile = File('assets/sadf.text');
      // Assume the file is a valid image within the size limit
      final fileImage = FileImage.dirty(imageFile);
      expect(fileImage.error, FileImageValidationError.invalid);
    });
  });
}
