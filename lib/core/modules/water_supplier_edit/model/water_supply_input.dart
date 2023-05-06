import 'package:formz/formz.dart';

enum WaterSupplyInputValidationError { empty }

class WaterSupplyInput
    extends FormzInput<String, WaterSupplyInputValidationError> {
  const WaterSupplyInput.pure([String value = '']) : super.pure(value);
  const WaterSupplyInput.dirty([String value = '']) : super.dirty(value);

  @override
  WaterSupplyInputValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return WaterSupplyInputValidationError.empty;
    }

    return null;
  }
}
