import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/budget_type.dart';

enum BudgetTypeInputValidationError { empty }

class BudgetTypeInput
    extends FormzInput<BudgetTypeEnum?, BudgetTypeInputValidationError> {
  const BudgetTypeInput.pure([BudgetTypeEnum? value]) : super.pure(value);
  const BudgetTypeInput.dirty([BudgetTypeEnum? value]) : super.dirty(value);

  @override
  BudgetTypeInputValidationError? validator(BudgetTypeEnum? value) {
    if (value == null) {
      return BudgetTypeInputValidationError.empty;
    }

    return null;
  }
}
