part of 'user_bloc.dart';

class UserState extends Equatable {
  final String fullName, firstName, lastName, role, provinceEntry;

  const UserState({
    this.fullName = '',
    this.firstName = '',
    this.lastName = '',
    this.role = '',
    this.provinceEntry = ''
  });

  @override
  List<Object?> get props => [
    fullName,
    firstName,
    lastName,
    role,
    provinceEntry,
  ];
}