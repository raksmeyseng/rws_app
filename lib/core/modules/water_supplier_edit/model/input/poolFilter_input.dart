import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/filter_enum.dart';

enum FilterInputValidationError { empty }

class PoolfilterInput
    extends FormzInput<FilterEnum?, FilterInputValidationError> {
  const PoolfilterInput.pure([FilterEnum? value]) : super.pure(value);
  const PoolfilterInput.dirty([FilterEnum? value]) : super.dirty(value);

  @override
  FilterInputValidationError? validator(FilterEnum? value) {
    if (value == null) {
      return FilterInputValidationError.empty;
    }

    return null;
  }
}
