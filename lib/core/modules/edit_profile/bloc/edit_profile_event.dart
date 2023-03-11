part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class EditProfileStarted extends EditProfileEvent {
  const EditProfileStarted();
}

class ProfilePictureUploaded extends EditProfileEvent {
  const ProfilePictureUploaded(this.file);
  final XFile file;
  @override
  List<Object> get props => [file];
}

class ProfilePictureRemoved extends EditProfileEvent {
  const ProfilePictureRemoved();
}

class FullNameChanged extends EditProfileEvent {
  const FullNameChanged(this.fullName);
  final String fullName;
  @override
  List<Object> get props => [fullName];
}

class DOBChanged extends EditProfileEvent {
  const DOBChanged(this.dob);
  final DateTime dob;
  @override
  List<Object> get props => [dob];
}

class GenderChanged extends EditProfileEvent {
  const GenderChanged(this.gender);
  final GenderEnum gender;
  @override
  List<Object> get props => [gender];
}

class PhoneNumberChanged extends EditProfileEvent {
  const PhoneNumberChanged(this.phoneNumber);
  final String phoneNumber;
  @override
  List<Object> get props => [phoneNumber];
}

class EmailChanged extends EditProfileEvent {
  const EmailChanged(this.email);
  final String email;
  @override
  List<Object> get props => [email];
}

class EditProfileFormSubmitted extends EditProfileEvent {
  const EditProfileFormSubmitted();
}

class UserPasswordChanged extends EditProfileEvent {
  const UserPasswordChanged(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

class ConfirmUserPasswordChanged extends EditProfileEvent {
  const ConfirmUserPasswordChanged(this.password);
  final String password;
  @override
  List<Object> get props => [password];
}

class PasswordExpiryChanged extends EditProfileEvent {
  const PasswordExpiryChanged(this.date);
  final DateTime date;
  @override
  List<Object> get props => [date];
}

class PasswordVisibilityToggled extends EditProfileEvent {
  const PasswordVisibilityToggled();
}

class ConfirmPasswordVisibilityToggled extends EditProfileEvent {
  const ConfirmPasswordVisibilityToggled();
}
