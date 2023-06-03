import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/check_water_quality_enum.dart';

enum CheckWaterQualityInputValidationError { empty }

class CheckWaterQualityInput
    extends FormzInput<CheckWaterQualityEnum?, CheckWaterQualityInputValidationError> {
  const CheckWaterQualityInput.pure([CheckWaterQualityEnum? value]) : super.pure(value);
  const CheckWaterQualityInput.dirty([CheckWaterQualityEnum? value]) : super.dirty(value);

  @override
  CheckWaterQualityInputValidationError? validator(CheckWaterQualityEnum? value) {
    if (value == null) {
      return CheckWaterQualityInputValidationError.empty;
    }

    return null;
  }
}