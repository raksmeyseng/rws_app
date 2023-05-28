import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/management_type.dart';

enum ManagementTypeInputValidationError { empty }

class ManagementTypeInput extends FormzInput<ManagementTypeEnum?,
    ManagementTypeInputValidationError> {
  const ManagementTypeInput.pure([ManagementTypeEnum? value])
      : super.pure(value);
  const ManagementTypeInput.dirty([ManagementTypeEnum? value])
      : super.dirty(value);

  @override
  ManagementTypeInputValidationError? validator(ManagementTypeEnum? value) {
    if (value == null) {
      return ManagementTypeInputValidationError.empty;
    }

    return null;
  }
}
