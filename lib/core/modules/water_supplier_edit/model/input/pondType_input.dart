import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/pond_type_enum.dart';

enum FilterInputValidationError { empty }

class PondTypeInput
    extends FormzInput<PondTypeEnum?, FilterInputValidationError> {
  const PondTypeInput.pure([PondTypeEnum? value]) : super.pure(value);
  const PondTypeInput.dirty([PondTypeEnum? value]) : super.dirty(value);

  @override
  FilterInputValidationError? validator(PondTypeEnum? value) {
    if (value == null) {
      return FilterInputValidationError.empty;
    }

    return null;
  }
}