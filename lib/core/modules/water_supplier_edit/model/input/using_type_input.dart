import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/using_type_enum.dart';

enum UsingTypeIInputValidationError { empty }

class UsingTypeInput
    extends FormzInput<UsingTypeEnum?, UsingTypeIInputValidationError> {
  const UsingTypeInput.pure([UsingTypeEnum? value]) : super.pure(value);
  const UsingTypeInput.dirty([UsingTypeEnum? value]) : super.dirty(value);

  @override
  UsingTypeIInputValidationError? validator(UsingTypeEnum? value) {
    if (value == null) {
      return UsingTypeIInputValidationError.empty;
    }

    return null;
  }
}