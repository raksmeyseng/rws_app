import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class CurrentPassword extends FormzInput<String, PasswordValidationError> {
  const CurrentPassword.pure([String value = '']) : super.pure(value);
  const CurrentPassword.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.empty;
    }
    // final newValue = value.replaceAll(' ', '');

    // /// Phone pattern
    // final pattern = RegExp('^[0-9]');
    // if (!pattern.hasMatch(newValue)) {
    //   return PasswordValidationError.invalid;
    // }

    return null;
  }
}


class NewPassword extends FormzInput<String, PasswordValidationError> {
  const NewPassword.pure([String value = '']) : super.pure(value);
  const NewPassword.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.empty;
    }
    // final newValue = value.replaceAll(' ', '');

    // /// Phone pattern
    // final pattern = RegExp('^[0-9]');
    // if (!pattern.hasMatch(newValue)) {
    //   return PasswordValidationError.invalid;
    // }

    return null;
  }
}
