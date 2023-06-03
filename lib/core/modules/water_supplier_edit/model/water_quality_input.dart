import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/water_quality_enum.dart';

enum WaterQualityInputValidationError { empty }

class WaterQualityInput
    extends FormzInput<WaterQualityEnum?, WaterQualityInputValidationError> {
  const WaterQualityInput.pure([WaterQualityEnum? value]) : super.pure(value);
  const WaterQualityInput.dirty([WaterQualityEnum? value]) : super.dirty(value);

  @override
  WaterQualityInputValidationError? validator(WaterQualityEnum? value) {
    if (value == null) {
      return WaterQualityInputValidationError.empty;
    }

    return null;
  }
}