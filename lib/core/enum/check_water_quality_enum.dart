import 'package:json_annotation/json_annotation.dart';

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
        return 'បាន';
      case CheckWaterQualityEnum.unCheck:
        return 'មិនបាន';
    }
  }
}
