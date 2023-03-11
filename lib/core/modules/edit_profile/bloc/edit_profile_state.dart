part of 'edit_profile_bloc.dart';

class EditProfileState extends Equatable {
  const EditProfileState._({
    this.formStatus = FormzStatus.pure,
    this.uploadedProfile,
    this.uploadStatus = BaseStatusEnum.initial,
    this.fullNameInput = const FullNameInput.pure(),
    this.phoneNumberInput = const PhoneNumberInput.pure(),
    this.emailInput = const EmailInput.pure(),
    this.isFormChanged = false,
    this.passwordVisibility = false,
    this.confirmPasswordVisibility = false,
  });

  final FormzStatus formStatus;
  final UploadedFileModel? uploadedProfile;
  final BaseStatusEnum uploadStatus;
  final FullNameInput fullNameInput;
  final PhoneNumberInput phoneNumberInput;
  final EmailInput emailInput;
  final bool isFormChanged;
  final bool passwordVisibility;
  final bool confirmPasswordVisibility;

  const EditProfileState.initial() : this._();

  EditProfileState copyWith({
    FormzStatus? formStatus,
    UploadedFileModel? uploadedProfile,
    BaseStatusEnum? uploadStatus,
    FullNameInput? fullNameInput,
    DOBInput? dobInput,
    GenderInput? genderInput,
    PhoneNumberInput? phoneNumberInput,
    EmailInput? emailInput,
    bool? isFormChanged,
    bool? passwordVisibility,
    bool? confirmPasswordVisibility,
  }) {
    return EditProfileState._(
      formStatus: formStatus ?? this.formStatus,
      uploadedProfile: uploadedProfile ?? this.uploadedProfile,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      fullNameInput: fullNameInput ?? this.fullNameInput,
      phoneNumberInput: phoneNumberInput ?? this.phoneNumberInput,
      emailInput: emailInput ?? this.emailInput,
      isFormChanged: isFormChanged ?? this.isFormChanged,
      passwordVisibility: passwordVisibility ?? this.passwordVisibility,
      confirmPasswordVisibility:
          confirmPasswordVisibility ?? this.confirmPasswordVisibility,
    );
  }

  @override
  List<Object?> get props => [
        formStatus,
        uploadedProfile,
        uploadStatus,
        fullNameInput,
        phoneNumberInput,
        emailInput,
        isFormChanged,
      ];
}
