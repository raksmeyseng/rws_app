import 'package:rws_app/core/enum/gender_enum.dart';
import 'package:formz/formz.dart';

enum GenderInputValidationError { empty }

class GenderInput extends FormzInput<GenderEnum?, GenderInputValidationError> {
  const GenderInput.pure([GenderEnum? value]) : super.pure(value);
  const GenderInput.dirty([GenderEnum? value]) : super.dirty(value);

  @override
  GenderInputValidationError? validator(GenderEnum? value) {
    return null;
  }
}
