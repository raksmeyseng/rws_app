import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/well_status_enum.dart';

enum WellStatusInputValidationError { empty }

class WellStatusInput
    extends FormzInput<WellStatusEnum?, WellStatusInputValidationError> {
  const WellStatusInput.pure([WellStatusEnum? value]) : super.pure(value);
  const WellStatusInput.dirty([WellStatusEnum? value]) : super.dirty(value);

  @override
  WellStatusInputValidationError? validator(WellStatusEnum? value) {
    if (value == null) {
      return WellStatusInputValidationError.empty;
    }

    return null;
  }
}