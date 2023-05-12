import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

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

  String getDisplayText(BuildContext context) {
    switch (this) {
      case PondStatusEnum.unMaintain:
        return 'មិនមានការការពារនិងថែទាំ';
      case PondStatusEnum.maintain:
        return 'មានការការពារថែទាំ';
      case PondStatusEnum.unUse:
        return 'មិនប្រើប្រាស់';
    }
  }
}
