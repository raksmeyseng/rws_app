import 'package:json_annotation/json_annotation.dart';

const int _govermentCode = 1;
const int _organizationCode = 2;
const int _charityCode = 3;

enum BudgetTypeEnum {
  @JsonValue(_govermentCode)
  goverment,
  @JsonValue(_organizationCode)
  organization,
  @JsonValue(_charityCode)
  charity,
}

extension BudgetTypeEnumExtension on BudgetTypeEnum {
  int getCode() {
    switch (this) {
      case BudgetTypeEnum.goverment:
        return _govermentCode;
      case BudgetTypeEnum.organization:
        return _organizationCode;
      case BudgetTypeEnum.charity:
        return _charityCode;
    }
  }

  /// User friendly text
  String getDisplayText() {
    switch (this) {
      case BudgetTypeEnum.goverment:
        return 'រដ្ឋ';
      case BudgetTypeEnum.organization:
        return 'អង្គការ';
      case BudgetTypeEnum.charity:
        return 'សប្បុរស';
    }
  }
}

BudgetTypeEnum? getBudgetTypeEnumById(int id){
  switch (id) {
      case 0:
        return BudgetTypeEnum.goverment;
      case 1:
        return BudgetTypeEnum.organization;
      case 3:
        return BudgetTypeEnum.charity;
    }
}

String getBudgetTypeEnumDisplayText(BudgetTypeEnum value) {
    switch (value) {
      case BudgetTypeEnum.goverment:
        return 'រដ្ឋ';
      case BudgetTypeEnum.organization:
        return 'អង្គការ';
      case BudgetTypeEnum.charity:
        return 'សប្បុរស';
    }
  }