import 'package:formz/formz.dart';

enum EmailInputValidationError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputValidationError> {
  const EmailInput.pure([String value = '']) : super.pure(value);
  const EmailInput.dirty([String value = '']) : super.dirty(value);

  @override
  EmailInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailInputValidationError.empty;
    }
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regex.hasMatch(value)) {
      return EmailInputValidationError.invalid;
    }
    return null;
  }
}
