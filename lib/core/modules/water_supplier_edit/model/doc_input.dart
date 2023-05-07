import 'package:formz/formz.dart';

enum DOCInputValidationError { empty, invalid }

class DOCInput extends FormzInput<DateTime?, DOCInputValidationError> {
  const DOCInput.pure([DateTime? value]) : super.pure(value);
  const DOCInput.dirty([DateTime? value]) : super.dirty(value);

  @override
  DOCInputValidationError? validator(DateTime? value) {
    return null;
  }
}
