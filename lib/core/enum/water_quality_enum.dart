import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

const int _wellCode = 0;
const int _unWellCode = 1;

enum WaterQualityEnum {
  @JsonValue(_wellCode)
  well,
  @JsonValue(_unWellCode)
  unWell,
}

extension WaterQualityEnumExtension on WaterQualityEnum {
  int getCode() {
    switch (this) {
      case WaterQualityEnum.well:
        return _wellCode;
      case WaterQualityEnum.unWell:
        return _unWellCode;
    }
  }

  String getDisplayText() {
    switch (this) {
      case WaterQualityEnum.well:
        return S.current.good;
      case WaterQualityEnum.unWell:
        return S.current.bad;
    }
  }
}

WaterQualityEnum? getWaterQualityEnumById(int id) {
  switch (id) {
    case 8:
      return WaterQualityEnum.well;
    case 9:
      return WaterQualityEnum.unWell;
  }
  return null;
}

String getWaterQualityEnumDisplayText(WaterQualityEnum value) {
  switch (value) {
    case WaterQualityEnum.well:
      return 'ល្អ';
    case WaterQualityEnum.unWell:
      return 'មិនល្អ';
  }
}
