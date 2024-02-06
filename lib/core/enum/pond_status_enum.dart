import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

const int _unMaintainCode = 0;
const int _maintainCode = 1;
const int _unUseCode = 2;

enum PondStatusEnum {
  @JsonValue(_unMaintainCode)
  unMaintain,
  @JsonValue(_maintainCode)
  maintain,
  @JsonValue(_unUseCode)
  unUse,
}

extension PondStatusEnumExtension on PondStatusEnum {
  int getCode() {
    switch (this) {
      case PondStatusEnum.unMaintain:
        return _unMaintainCode;
      case PondStatusEnum.maintain:
        return _maintainCode;
      case PondStatusEnum.unUse:
        return _unUseCode;
    }
  }

  String getDisplayText() {
    switch (this) {
      case PondStatusEnum.unMaintain:
        return S.current.no_protection_and_maintenance;
      case PondStatusEnum.maintain:
        return S.current.protected_and_maintained;
      case PondStatusEnum.unUse:
        return S.current.not_used;
    }
  }
}

PondStatusEnum? getPondStatusEnumById(int id) {
  switch (id) {
    case 36:
      return PondStatusEnum.unMaintain;
    case 37:
      return PondStatusEnum.maintain;
    case 38:
      return PondStatusEnum.unUse;
  }
  return null;
}

String getPondStatusEnumDisplayText(PondStatusEnum value) {
  switch (value) {
    case PondStatusEnum.unMaintain:
      return 'មិនមានការការពារនិងថែទាំ';
    case PondStatusEnum.maintain:
      return 'មានការការពារថែទាំ';
    case PondStatusEnum.unUse:
      return 'មិនប្រើប្រាស់';
  }
}
