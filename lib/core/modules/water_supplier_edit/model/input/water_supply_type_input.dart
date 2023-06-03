
import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/water_supply_type_enum.dart';

enum WaterSupplyTypeInputValidationError { empty }

class WaterSupplyTypeInput
    extends FormzInput<WaterSupplyTypeEnum?, WaterSupplyTypeInputValidationError> {
  const WaterSupplyTypeInput.pure([WaterSupplyTypeEnum? value]) : super.pure(value);
  const WaterSupplyTypeInput.dirty([WaterSupplyTypeEnum? value]) : super.dirty(value);

  @override
  WaterSupplyTypeInputValidationError? validator(WaterSupplyTypeEnum? value) {
    if (value == null) {
      return WaterSupplyTypeInputValidationError.empty;
    }

    return null;
  }
}