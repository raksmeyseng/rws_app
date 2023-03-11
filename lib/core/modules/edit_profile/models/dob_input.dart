import 'package:formz/formz.dart';

enum DOBInputValidationError { empty, invalid }

class DOBInput extends FormzInput<DateTime?, DOBInputValidationError> {
  const DOBInput.pure([DateTime? value]) : super.pure(value);
  const DOBInput.dirty([DateTime? value]) : super.dirty(value);

  @override
  DOBInputValidationError? validator(DateTime? value) {
    return null;
  }
}
