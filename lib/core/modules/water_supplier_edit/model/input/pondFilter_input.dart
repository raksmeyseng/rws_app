import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/pond_filter_enum.dart';

enum FilterInputValidationError { empty }

class PondfilterInput
    extends FormzInput<PondFilterEnum?, FilterInputValidationError> {
  const PondfilterInput.pure([PondFilterEnum? value]) : super.pure(value);
  const PondfilterInput.dirty([PondFilterEnum? value]) : super.dirty(value);

  @override
  FilterInputValidationError? validator(PondFilterEnum? value) {
    if (value == null) {
      return FilterInputValidationError.empty;
    }

    return null;
  }
}
