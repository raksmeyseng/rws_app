import 'package:formz/formz.dart';

enum PasswordInputValidationError { empty, invalid }

class PasswordInput extends FormzInput<String, PasswordInputValidationError> {
  const PasswordInput.pure([String value = '']) : super.pure(value);
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordInputValidationError.empty;
    }
    return null;
  }
}
