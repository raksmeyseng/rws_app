import 'package:formz/formz.dart';

enum UserNameInputValidationError { empty, invalid }

class UserNameInput extends FormzInput<String, UserNameInputValidationError> {
  const UserNameInput.pure([String value = '']) : super.pure(value);
  const UserNameInput.dirty([String value = '']) : super.dirty(value);

  @override
  UserNameInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return UserNameInputValidationError.empty;
    }
    return null;
  }
}
