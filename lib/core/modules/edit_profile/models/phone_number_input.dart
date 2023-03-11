import 'package:formz/formz.dart';

enum PhoneNumberInputValidationError { empty, invalid }

class PhoneNumberInput
    extends FormzInput<String, PhoneNumberInputValidationError> {
  const PhoneNumberInput.pure([String value = '']) : super.pure(value);
  const PhoneNumberInput.dirty([String value = '']) : super.dirty(value);

  @override
  PhoneNumberInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty || value.trim() == '0') {
      return PhoneNumberInputValidationError.empty;
    }
    final newValue = value.replaceAll(' ', '');

    /// Phone pattern
    final pattern = RegExp('^0[1-9][0-9]{7,8}\$');
    if (!pattern.hasMatch(newValue)) {
      return PhoneNumberInputValidationError.invalid;
    }

    return null;
  }

  @override
  String get value =>
      super.value.startsWith('0') ? super.value : '0${super.value}';

  /// Get only text without prefix/suffix
  String get text =>
      super.value.startsWith('0') ? super.value.substring(1) : super.value;
}
