import 'dart:developer';

import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/gender_enum.dart';
import 'package:rws_app/core/models/uploaded_file_model.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/edit_profile/models/dob_input.dart';
import 'package:rws_app/core/modules/edit_profile/models/email_input.dart';
import 'package:rws_app/core/modules/edit_profile/models/full_name_input.dart';
import 'package:rws_app/core/modules/edit_profile/models/gender_input.dart';
import 'package:rws_app/core/modules/edit_profile/models/phone_number_input.dart';
import 'package:rws_app/core/modules/edit_profile/models/user_payload_model.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(const EditProfileState.initial()) {
    on<EditProfileEvent>(_onEvent);
  }

  final fullNameFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  final passwordExpiryFocus = FocusNode();

  final fullNameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordExpiryController = TextEditingController();

  Future<void> _onEvent(
    EditProfileEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    if (event is EditProfileStarted) {
      return _onStarted(event, emit);
    }
    if (event is ProfilePictureUploaded) {
      return _uploadProfilePicture(event, emit);
    }
    if (event is ProfilePictureRemoved) {
      return _removeProfilePicture(emit);
    }
    if (event is FullNameChanged) {
      return _onFullNameChanged(event, emit);
    }
    if (event is PhoneNumberChanged) {
      return _onPhoneNumberChanged(event, emit);
    }
    if (event is EmailChanged) {
      return _onEmailChanged(event, emit);
    }
    if (event is EditProfileFormSubmitted) {
      return _onSubmitted(event, emit);
    }

    if (event is PasswordVisibilityToggled) {
      return _onPasswordVisibilityToggled(event, emit);
    }
    if (event is ConfirmPasswordVisibilityToggled) {
      return _onConfirmPasswordVisibilityToggled(event, emit);
    }
  }

  void _onStarted(EditProfileEvent event, Emitter<EditProfileState> emit) {
    final user = Application.authBloc.state.user!;
    final fullNameInput = FullNameInput.pure(user.fullName);

    final phoneNumberInput =
        PhoneNumberInput.pure(phoneBeautify(user.phoneNumber));
    final emailInput = EmailInput.pure(user.email ?? '');

    fullNameController.text = fullNameInput.value;

    phoneNumberController.text = phoneNumberInput.text;
    emailController.text = emailInput.value;

    emit(state.copyWith(
      fullNameInput: fullNameInput,
      phoneNumberInput: phoneNumberInput,
      emailInput: emailInput,
    ));
  }

  Future<void> _uploadProfilePicture(
    ProfilePictureUploaded event,
    Emitter<EditProfileState> emit,
  ) async {
    try {
      emit(state.copyWith(uploadStatus: BaseStatusEnum.inprogress));
      if (kIsWeb) {
        final uploaded =
            await Application.mediaRepo.uploadFileForWeb(event.file);
        emit(state.copyWith(
          uploadedProfile: uploaded,
          uploadStatus: BaseStatusEnum.success,
        ));
      } else {
        final uploaded = await Application.mediaRepo.uploadFile(event.file);
        emit(state.copyWith(
          uploadedProfile: uploaded,
          uploadStatus: BaseStatusEnum.success,
        ));
      }
    } catch (e) {
      inspect(e);
      emit(state.copyWith(uploadStatus: BaseStatusEnum.failure));
    }
  }

  Future<void> _removeProfilePicture(Emitter<EditProfileState> emit) async {
    emit(state.copyWith(uploadStatus: BaseStatusEnum.inprogress));
    await Future.delayed(const Duration(milliseconds: 300));
    emit(state.copyWith(
      uploadedProfile: UploadedFileModel.empty,
      uploadStatus: BaseStatusEnum.success,
    ));
  }

  void _onFullNameChanged(
    FullNameChanged event,
    Emitter<EditProfileState> emit,
  ) {
    final fullNameInput = FullNameInput.pure(event.fullName);
    emit(state.copyWith(
      fullNameInput: fullNameInput,
      isFormChanged: true,
    ));
  }

  void _onPhoneNumberChanged(
    PhoneNumberChanged event,
    Emitter<EditProfileState> emit,
  ) {
    final phoneNumberInput = PhoneNumberInput.pure(event.phoneNumber);
    emit(state.copyWith(
      phoneNumberInput: phoneNumberInput,
      isFormChanged: true,
    ));
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<EditProfileState> emit,
  ) {
    final emailInput = EmailInput.pure(event.email);
    emit(state.copyWith(
      emailInput: emailInput,
      isFormChanged: true,
    ));
  }

  void _onPasswordVisibilityToggled(
    PasswordVisibilityToggled event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(passwordVisibility: !state.passwordVisibility));
  }

  void _onConfirmPasswordVisibilityToggled(
    ConfirmPasswordVisibilityToggled event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(
      confirmPasswordVisibility: !state.confirmPasswordVisibility,
    ));
  }

  void _onSubmitted(
    EditProfileFormSubmitted event,
    Emitter<EditProfileState> emit,
  ) async {
    final fullNameInput = FullNameInput.dirty(state.fullNameInput.value);
    final phoneNumberInput =
        PhoneNumberInput.dirty(state.phoneNumberInput.value);
    final emailInput = EmailInput.dirty(state.emailInput.value);

    emit(state.copyWith(
      fullNameInput: fullNameInput,
      phoneNumberInput: phoneNumberInput,
      emailInput: emailInput,
      formStatus: Formz.validate([
        fullNameInput,
        emailInput,
      ]),
    ));

    if (state.formStatus.isValidated) {
      emit(state.copyWith(formStatus: FormzStatus.submissionInProgress));
      try {
        final user = Application.authBloc.state.user!;
        final pro = state.uploadedProfile ?? UploadedFileModel.empty;
        final payload = UserPayloadModel(
          fullName: fullNameInput.value,
          email: emailInput.value,
          phoneNumber: user.phoneNumber,
          profileId: pro.id.isNotEmpty ? pro.id : user.profileId,
          profileUrl: pro.url.isNotEmpty ? pro.url : user.profileUrl,
        );

        final res = await Application.authRepo.updateProfile(user.id, payload);
        Application.authBloc.add(UserUpdated(res));
        emit(state.copyWith(formStatus: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(formStatus: FormzStatus.submissionFailure));
      }
    }
  }
}
