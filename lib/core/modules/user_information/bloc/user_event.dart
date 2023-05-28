part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}

class UserFullName extends UserEvent {
  const UserFullName(this.fullName);

  final String fullName;

  @override
  List<Object> get props => [fullName];
}

class UserFirstName extends UserEvent {
  const UserFirstName(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class UserLastName extends UserEvent {
  const UserLastName(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class UserRole extends UserEvent {
  const UserRole(this.role);

  final String role;

  @override
  List<Object> get props => [role];
}

class UserProvinceEntry extends UserEvent {
  const UserProvinceEntry(this.provinceEntry);

  final String provinceEntry;

  @override
  List<Object> get props => [provinceEntry];
}