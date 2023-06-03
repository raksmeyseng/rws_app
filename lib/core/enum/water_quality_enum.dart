import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

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
        return 'ល្អ';
      case WaterQualityEnum.unWell:
        return 'មិនល្អ';
    }
  }
}
