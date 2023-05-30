import 'package:formz/formz.dart';

import '../../../enum/area_enum.dart';

enum LocationRiskInputValidationError { empty }

class LocationRiskInput
    extends FormzInput<AreaEnum?, LocationRiskInputValidationError> {
  const LocationRiskInput.pure([AreaEnum? value]) : super.pure(value);
  const LocationRiskInput.dirty([AreaEnum? value]) : super.dirty(value);

  @override
  LocationRiskInputValidationError? validator(AreaEnum? value) {
    if (value == null) {
      return LocationRiskInputValidationError.empty;
    }

    return null;
  }
}