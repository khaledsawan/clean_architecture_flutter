import 'dart:io';

import 'package:clean_architecture_flutter/features/common_forms/common_form.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../di.dart';
import '../../data/model/request/signup/signup_request.dart';
import '../../domain/use_case/signup_use_case.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final signUpUseCase = SignUpUseCase(getIt());

  SignUpBloc() : super(const SignUpState()) {
    on<SignUpButtonPressed>(_onSubmitted);
    on<EmailChange>(_onEmailChanged);
    on<PasswordChange>(_onPasswordChanged);
    on<EmailChangeUnFocus>(_onEmailUnfocused);
    on<PasswordChangeUnFocus>(_onPasswordUnfocused);
    on<ImageChange>(_onImageChange);
    on<ImageDeleted>(_onImageDeleted);
  }

  void _onImageChange(ImageChange event, Emitter<SignUpState> emit) {
    final image = FileImage.dirty(event.image);
    final isValid = Formz.validate([image, state.password, state.email]);
    emit(
      state.copyWith(
        image: image,
        isValid: isValid,
      ),
    );
  }

  void _onImageDeleted(ImageDeleted event, Emitter<SignUpState> emit) {
    final isValid = false;
    emit(
      state.copyWith(
        image: null,
        isValid: isValid,
      ),
    );
  }

  void _onEmailChanged(EmailChange event, Emitter<SignUpState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email.isValid ? email : Email.dirty(event.email),
        isValid: Formz.validate([email, state.password, state.image]),
      ),
    );
  }

  void _onPasswordChanged(
    PasswordChange event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.email, state.image]),
      ),
    );
  }

  void _onPasswordUnfocused(
    PasswordChangeUnFocus event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password, state.image]),
      ),
    );
  }

  void _onEmailUnfocused(EmailChangeUnFocus event, Emitter<SignUpState> emit) {
    final email = Email.dirty(state.email.value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password, state.image]),
      ),
    );
  }

  Future<void> _onSubmitted(
    SignUpButtonPressed event,
    Emitter<SignUpState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final image = FileImage.dirty(state.image.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        image: image,
        isValid: Formz.validate([email, password, image]),
      ),
    );
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final response = await signUpUseCase.call(
            SignUpRequest(
                email: state.email.value, password: state.password.value));
        print(response);
        response.fold((l) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));

        }, (r) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));

        });
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
