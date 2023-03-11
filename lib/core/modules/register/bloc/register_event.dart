part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ProfilePictureUploaded extends RegisterEvent {
  const ProfilePictureUploaded(this.file);
  final XFile file;
  @override
  List<Object> get props => [file];
}

class FullNameChanged extends RegisterEvent {
  const FullNameChanged(this.fullName);
  final String fullName;
  @override
  List<Object> get props => [fullName];
}

class DOBChanged extends RegisterEvent {
  const DOBChanged(this.dob);
  final DateTime dob;
  @override
  List<Object> get props => [dob];
}

class GenderChanged extends RegisterEvent {
  const GenderChanged(this.gender);
  final GenderEnum gender;
  @override
  List<Object> get props => [gender];
}

class PhoneNumberChanged extends RegisterEvent {
  const PhoneNumberChanged(this.phoneNumber);
  final String phoneNumber;
  @override
  List<Object> get props => [phoneNumber];
}

class EmailChanged extends RegisterEvent {
  const EmailChanged(this.email);
  final String email;
  @override
  List<Object> get props => [email];
}

class PrivacyAgreedCheckChanged extends RegisterEvent {
  const PrivacyAgreedCheckChanged(this.checked);
  final bool checked;
  @override
  List<Object> get props => [checked];
}

class RegisterFormSubmitted extends RegisterEvent {
  const RegisterFormSubmitted();
}
