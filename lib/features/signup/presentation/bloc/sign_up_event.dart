part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class ImageChange extends SignUpEvent {
  final File image;

  ImageChange({required this.image});
}
class ImageDeleted extends SignUpEvent {
}

class EmailChange extends SignUpEvent {
  final String email;

  EmailChange({required this.email});
}

class EmailChangeUnFocus extends SignUpEvent {}

class PasswordChange extends SignUpEvent {
  final String password;

  PasswordChange({required this.password});
}

class PasswordChangeUnFocus extends SignUpEvent {}

class SignUpButtonPressed extends SignUpEvent {}
