import 'package:formz/formz.dart';

enum FullNameInputValidationError { empty }

class FullNameInput extends FormzInput<String, FullNameInputValidationError> {
  const FullNameInput.pure([String value = '']) : super.pure(value);
  const FullNameInput.dirty([String value = '']) : super.dirty(value);

  @override
  FullNameInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return FullNameInputValidationError.empty;
    }

    return null;
  }
}
