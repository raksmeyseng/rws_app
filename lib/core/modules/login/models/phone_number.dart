import 'package:formz/formz.dart';

enum PhoneNumberValidationError { empty, invalid }

class PhoneNumber extends FormzInput<String, PhoneNumberValidationError> {
  const PhoneNumber.pure([String value = '']) : super.pure(value);
  const PhoneNumber.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneNumberValidationError? validator(String? value) {
    if (value == null || value.isEmpty || value.trim() == '0') {
      return PhoneNumberValidationError.empty;
    }
    final newValue = value.replaceAll(' ', '');

    /// Phone pattern
    final pattern = RegExp('^0[1-9][0-9]{7,8}\$');
    if (!pattern.hasMatch(newValue)) {
      return PhoneNumberValidationError.invalid;
    }

    return null;
  }

  String get valueInput =>
      super.value.startsWith('0') ? super.value.substring(1) : super.value;

  @override
  String get value =>
      super.value.startsWith('0') ? super.value : '0${super.value}';
}
