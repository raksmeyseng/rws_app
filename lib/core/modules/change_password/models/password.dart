import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([String value = '']) : super.pure(value);
  const Password.dirty([String value = '']) : super.dirty(value);

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
