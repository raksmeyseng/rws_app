import 'dart:developer';

import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/gender_enum.dart';
import 'package:rws_app/core/models/uploaded_file_model.dart';
import 'package:rws_app/core/modules/authentication/models/register_payload_model.dart';
import 'package:rws_app/core/modules/register/models/dob_input.dart';
import 'package:rws_app/core/modules/register/models/email_input.dart';
import 'package:rws_app/core/modules/register/models/full_name_input.dart';
import 'package:rws_app/core/modules/register/models/gender_input.dart';
import 'package:rws_app/core/modules/register/models/phone_number_input.dart';
import 'package:rws_app/core/modules/register/models/register_data_model.dart';
import 'package:rws_app/core/security/security_helper.dart';
import 'package:rws_app/utils/helpers/sms_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState.initial()) {
    on<RegisterEvent>(_onEvent);
  }

  final fullNameFocus = FocusNode();
  final phoneNumberFocus = FocusNode();
  final emailFocus = FocusNode();

  Future<void> _onEvent(
    RegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (event is ProfilePictureUploaded) {
      return _uploadProfilePicture(event, emit);
    }
    if (event is FullNameChanged) {
      return _onFullNameChanged(event, emit);
    }
    if (event is DOBChanged) {
      return _onDOBChanged(event, emit);
    }
    if (event is GenderChanged) {
      return _onGenderChanged(event, emit);
    }
    if (event is PhoneNumberChanged) {
      return _onPhoneNumberChanged(event, emit);
    }
    if (event is EmailChanged) {
      return _onEmailChanged(event, emit);
    }
    if (event is PrivacyAgreedCheckChanged) {
      return _onPrivacyAgreedCheckChanged(event, emit);
    }
    if (event is RegisterFormSubmitted) {
      return _onSubmitted(event, emit);
    }
  }

  Future<void> _uploadProfilePicture(
    ProfilePictureUploaded event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(state.copyWith(uploadStatus: BaseStatusEnum.inprogress));
      final uploaded = await Application.mediaRepo.uploadFile(event.file);
      emit(state.copyWith(
        uploadedProfile: uploaded,
        uploadStatus: BaseStatusEnum.success,
      ));
    } catch (e) {
      inspect(e);
      emit(state.copyWith(uploadStatus: BaseStatusEnum.failure));
    }
  }

  void _onFullNameChanged(FullNameChanged event, Emitter<RegisterState> emit) {
    final fullNameInput = FullNameInput.pure(event.fullName);
    emit(state.copyWith(fullNameInput: fullNameInput));
  }

  void _onDOBChanged(DOBChanged event, Emitter<RegisterState> emit) {
    final dobInput = DOBInput.pure(event.dob);
    emit(state.copyWith(dobInput: dobInput));
  }

  void _onGenderChanged(GenderChanged event, Emitter<RegisterState> emit) {
    final genderInput = GenderInput.pure(event.gender);
    emit(state.copyWith(genderInput: genderInput));
  }

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<RegisterState> emit) {
    final phoneNumberInput = PhoneNumberInput.pure(event.phoneNumber);
    emit(state.copyWith(phoneNumberInput: phoneNumberInput));
  }

  void _onEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    final emailInput = EmailInput.pure(event.email);
    emit(state.copyWith(emailInput: emailInput));
  }

  void _onPrivacyAgreedCheckChanged(
    PrivacyAgreedCheckChanged event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(privacyAgreed: event.checked));
  }

  void _onSubmitted(
    RegisterFormSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    final fullNameInput = FullNameInput.dirty(state.fullNameInput.value);
    final dobInput = DOBInput.dirty(state.dobInput.value);
    final genderInput = GenderInput.dirty(state.genderInput.value);
    final phoneNumberInput =
        PhoneNumberInput.dirty(state.phoneNumberInput.value);
    final emailInput = EmailInput.dirty(state.emailInput.value);

    emit(state.copyWith(
      fullNameInput: fullNameInput,
      dobInput: dobInput,
      genderInput: genderInput,
      phoneNumberInput: phoneNumberInput,
      emailInput: emailInput,
      formStatus: Formz.validate([
        fullNameInput,
        dobInput,
        genderInput,
        phoneNumberInput,
        emailInput,
      ]),
    ));

    if (state.formStatus.isValidated) {
      emit(state.copyWith(formStatus: FormzStatus.submissionInProgress));
      try {
        final authRepo = Application.authRepo;
        final phone = phoneNumberInput.value.replaceAll(' ', '');
        final hashed = SecurityHelper.generateHashed(phone);
        final appSignature = await SmsHelper.getAppSignatureAsync();
        final payload = RegisterPayloadModel(
          clientId: AppConstant.clientId,
          phoneNumber: phone,
          hashed: hashed,
          appSignature: appSignature,
        );

        final res = await authRepo.register(payload);
        final data = RegisterDataModel(
          fullName: fullNameInput.value,
          phoneNumber: phoneNumberInput.value,
          dateOfBirth: dobInput.value,
          gender: genderInput.value,
          email: emailInput.value,
          registerResponse: res,
        );
        Application.router.pushNamed(AppRoute.register, extra: data);
        emit(state.copyWith(formStatus: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(formStatus: FormzStatus.submissionFailure));
      }
    }
  }
}
