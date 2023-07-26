import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/season_enum.dart';

enum FilterInputValidationError { empty }

class SeasonHasWaterInput
    extends FormzInput<SeasonEnum?, FilterInputValidationError> {
  const SeasonHasWaterInput.pure([SeasonEnum? value]) : super.pure(value);
  const SeasonHasWaterInput.dirty([SeasonEnum? value]) : super.dirty(value);

  @override
  FilterInputValidationError? validator(SeasonEnum? value) {
    if (value == null) {
      return FilterInputValidationError.empty;
    }

    return null;
  }
}