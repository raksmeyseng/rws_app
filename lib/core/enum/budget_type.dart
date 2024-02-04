import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';

const int _govermentCode = 0;
const int _organizationCode = 1;
const int _charityCode = 2;

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
        return S.current.government;
      case BudgetTypeEnum.organization:
        return S.current.organization;
      case BudgetTypeEnum.charity:
        return S.current.charity;
    }
  }
}

BudgetTypeEnum? getBudgetTypeEnumById(int id) {
  switch (id) {
    case 0:
      return BudgetTypeEnum.goverment;
    case 1:
      return BudgetTypeEnum.organization;
    case 3:
      return BudgetTypeEnum.charity;
  }
  return null;
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
