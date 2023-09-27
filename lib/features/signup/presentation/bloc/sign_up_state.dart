part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState(
      {this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.image =const FileImage.pure(),
      this.status = FormzSubmissionStatus.initial});

  final Email email;
  final Password password;
  final FileImage image;
  final FormzSubmissionStatus status;
  final bool isValid;

  SignUpState copyWith({
    Email? email,
    Password? password,
    FileImage? image,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [email, password, image, status, isValid];
}
