import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _activeCode = 1;
const int _inactiveCode = 2;

enum WellStatusEnum {
  @JsonValue(_activeCode)
  active,
  @JsonValue(_inactiveCode)
  inActive,
}

extension WellStatusEnumExtension on WellStatusEnum {
  int getCode() {
    switch (this) {
      case WellStatusEnum.active:
        return _activeCode;
      case WellStatusEnum.inActive:
        return _inactiveCode;
    }
  }

  String getDisplayText(BuildContext context) {
    switch (this) {
      case WellStatusEnum.active:
        return 'ដំណើរការ';
      case WellStatusEnum.inActive:
        return 'មិនដំណើរការ';
    }
  }
}
