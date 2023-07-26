import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/capacity_type_enum.dart';

enum CapacityInputValidationError { empty }

class CapacityInput
    extends FormzInput<CapacityTypeEnum?, CapacityInputValidationError> {
  const CapacityInput.pure([CapacityTypeEnum? value]) : super.pure(value);
  const CapacityInput.dirty([CapacityTypeEnum? value]) : super.dirty(value);

  @override
  CapacityInputValidationError? validator(CapacityTypeEnum? value) {
    if (value == null) {
      return CapacityInputValidationError.empty;
    }

    return null;
  }
}