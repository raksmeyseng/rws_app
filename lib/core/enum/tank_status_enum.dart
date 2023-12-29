import 'package:json_annotation/json_annotation.dart';

const int _useCode = 1;
const int _unUseCode = 2;

enum TankStatusEnum {
  @JsonValue(_useCode)
  use,
  @JsonValue(_unUseCode)
  unUse,
}

extension TankStatusEnumExtension on TankStatusEnum {
  int getCode() {
    switch (this) {
      case TankStatusEnum.use:
        return _useCode;
      case TankStatusEnum.unUse:
        return _unUseCode;
    }
  }

  String getDisplayText() {
    switch (this) {
      case TankStatusEnum.use:
        return 'ប្រើប្រាស់';
      case TankStatusEnum.unUse:
        return 'មិនប្រើប្រាស់';
    }
  }
}

TankStatusEnum? getTankStatusEnumById(int id) {
  switch (id) {
    case 42:
      return TankStatusEnum.use;
    case 43:
      return TankStatusEnum.unUse;
  }
  return null;
}

String getTankStatusEnumDisplayText(TankStatusEnum value) {
  switch (value) {
    case TankStatusEnum.use:
      return 'ប្រើប្រាស់';
    case TankStatusEnum.unUse:
      return 'មិនប្រើប្រាស់';
  }
}
