import 'package:json_annotation/json_annotation.dart';

const int _faceCode = 1;
const int _unfaceCode = 2;

enum AreaEnum {
  @JsonValue(_faceCode)
  face,
  @JsonValue(_unfaceCode)
  unface,
}

extension AreaEnumExtension on AreaEnum {
  int getCode() {
    switch (this) {
      case AreaEnum.face:
        return _faceCode;
      case AreaEnum.unface:
        return _unfaceCode;
    }
  }

  String getDisplayText() {
    switch (this) {
      case AreaEnum.face:
        return 'ប្រឈម';
      case AreaEnum.unface:
        return 'មិនប្រឈម';
    }
  }
}

AreaEnum? getAreaEnumById(bool isRisk) {
  if (isRisk) {
    return AreaEnum.face;
  } else {
    return AreaEnum.unface;
  }
}

String getAreaEnumDisplayText(AreaEnum value) {
  switch (value) {
    case AreaEnum.face:
      return 'ប្រឈម';
    case AreaEnum.unface:
      return 'មិនប្រឈម';
  }
}
