part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState._({
    this.formStatus = FormzStatus.pure,
    this.uploadedProfile = UploadedFileModel.empty,
    this.uploadStatus = BaseStatusEnum.initial,
    this.fullNameInput = const FullNameInput.pure(),
    this.dobInput = const DOBInput.pure(),
    this.genderInput = const GenderInput.pure(),
    this.phoneNumberInput = const PhoneNumberInput.pure(),
    this.emailInput = const EmailInput.pure(),
    this.privacyAgreed = false,
  });

  final FormzStatus formStatus;
  final UploadedFileModel uploadedProfile;
  final BaseStatusEnum uploadStatus;
  final FullNameInput fullNameInput;
  final DOBInput dobInput;
  final GenderInput genderInput;
  final PhoneNumberInput phoneNumberInput;
  final EmailInput emailInput;
  final bool privacyAgreed;

  const RegisterState.initial() : this._();

  RegisterState copyWith({
    FormzStatus? formStatus,
    UploadedFileModel? uploadedProfile,
    BaseStatusEnum? uploadStatus,
    FullNameInput? fullNameInput,
    DOBInput? dobInput,
    GenderInput? genderInput,
    PhoneNumberInput? phoneNumberInput,
    EmailInput? emailInput,
    bool? privacyAgreed,
  }) {
    return RegisterState._(
      formStatus: formStatus ?? this.formStatus,
      uploadedProfile: uploadedProfile ?? this.uploadedProfile,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      fullNameInput: fullNameInput ?? this.fullNameInput,
      dobInput: dobInput ?? this.dobInput,
      genderInput: genderInput ?? this.genderInput,
      phoneNumberInput: phoneNumberInput ?? this.phoneNumberInput,
      emailInput: emailInput ?? this.emailInput,
      privacyAgreed: privacyAgreed ?? this.privacyAgreed,
    );
  }

  @override
  List<Object> get props => [
        formStatus,
        uploadedProfile,
        uploadStatus,
        fullNameInput,
        dobInput,
        genderInput,
        phoneNumberInput,
        emailInput,
        privacyAgreed,
      ];
}
