import 'package:flutter/material.dart';
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

  String getDisplayText(BuildContext context) {
    switch (this) {
      case TankStatusEnum.use:
        return 'ប្រើប្រាស់';
      case TankStatusEnum.unUse:
        return 'មិនប្រើប្រាស់';
    }
  }
}
