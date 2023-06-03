
import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/well_type_enum.dart';

enum WellTypeInputValidatorError { empty }

class WellTypeInput extends FormzInput<WellTypeEnum?, WellTypeInputValidatorError>{
  const WellTypeInput.pure([WellTypeEnum? value]) : super.pure(value);
  const WellTypeInput.dirty([WellTypeEnum? value]) : super.dirty(value);

  @override
  WellTypeInputValidatorError? validator(WellTypeEnum? value) {
    if (value == null) {
      return WellTypeInputValidatorError.empty;
    }

    return null;
  }
}