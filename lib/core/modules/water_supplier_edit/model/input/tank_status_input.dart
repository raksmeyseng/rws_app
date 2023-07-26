import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/tank_status_enum.dart';

enum UsingTypeIInputValidationError { empty }

class TankStatusInput
    extends FormzInput<TankStatusEnum?, UsingTypeIInputValidationError> {
  const TankStatusInput.pure([TankStatusEnum? value]) : super.pure(value);
  const TankStatusInput.dirty([TankStatusEnum? value]) : super.dirty(value);

  @override
  UsingTypeIInputValidationError? validator(TankStatusEnum? value) {
    if (value == null) {
      return UsingTypeIInputValidationError.empty;
    }

    return null;
  }
}