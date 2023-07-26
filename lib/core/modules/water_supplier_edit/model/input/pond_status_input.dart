import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/pond_status_enum.dart';

enum WellStatusInputValidationError { empty }

class PondStatusInput
    extends FormzInput<PondStatusEnum?, WellStatusInputValidationError> {
  const PondStatusInput.pure([PondStatusEnum? value]) : super.pure(value);
  const PondStatusInput.dirty([PondStatusEnum? value]) : super.dirty(value);

  @override
  WellStatusInputValidationError? validator(PondStatusEnum? value) {
    if (value == null) {
      return WellStatusInputValidationError.empty;
    }

    return null;
  }
}