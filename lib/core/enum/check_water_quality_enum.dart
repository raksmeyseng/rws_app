import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

const int _checkCode = 0;
const int _unCheckCode = 1;

enum CheckWaterQualityEnum {
  @JsonValue(_checkCode)
  check,
  @JsonValue(_unCheckCode)
  unCheck,
}

extension CheckWaterQualityEnumExtension on CheckWaterQualityEnum {
  int getCode() {
    switch (this) {
      case CheckWaterQualityEnum.check:
        return _checkCode;
      case CheckWaterQualityEnum.unCheck:
        return _unCheckCode;
    }
  }

  String getDisplayText() {
    switch (this) {
      case CheckWaterQualityEnum.check:
        return S.current.have;
      case CheckWaterQualityEnum.unCheck:
        return S.current.nohave;
    }
  }
}

CheckWaterQualityEnum? getCheckWaterQualityEnumById(int id) {
  switch (id) {
    case 10:
      return CheckWaterQualityEnum.check;
    case 11:
      return CheckWaterQualityEnum.unCheck;
  }
  return null;
}

String getCheckWaterQualityEnumDisplayText(CheckWaterQualityEnum value) {
  switch (value) {
    case CheckWaterQualityEnum.check:
      return 'បាន';
    case CheckWaterQualityEnum.unCheck:
      return 'មិនបាន';
  }
}
