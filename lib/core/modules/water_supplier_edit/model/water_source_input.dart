
import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/water_supply_type_enum.dart';

enum WaterSourceInputValidatorError { empty }

class WaterSourceInput extends FormzInput<WaterSupplyTypeEnum?, WaterSourceInputValidatorError>{
  const WaterSourceInput.pure([WaterSupplyTypeEnum? value]) : super.pure(value);
  const WaterSourceInput.dirty([WaterSupplyTypeEnum? value]) : super.dirty(value);

  @override
  WaterSourceInputValidatorError? validator(WaterSupplyTypeEnum? value) {
    if (value == null) {
      return WaterSourceInputValidatorError.empty;
    }

    return null;
  }
}