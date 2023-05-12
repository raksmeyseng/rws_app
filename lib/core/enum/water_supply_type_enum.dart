import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _underWaterCode = 0;
const int _onTheWaterCode = 1;
const int _springWaterCode = 2;
const int _allCode = 3;

enum WaterSupplyTypeEnum {
  @JsonValue(_underWaterCode)
  underWater,
  @JsonValue(_onTheWaterCode)
  onTheWater,
  @JsonValue(_springWaterCode)
  springWater,
  @JsonValue(_allCode)
  all,
}

extension WaterSupplyTypeEnumExtension on WaterSupplyTypeEnum {
  int getCode() {
    switch (this) {
      case WaterSupplyTypeEnum.underWater:
        return _underWaterCode;
      case WaterSupplyTypeEnum.onTheWater:
        return _onTheWaterCode;
      case WaterSupplyTypeEnum.springWater:
        return _springWaterCode;
      case WaterSupplyTypeEnum.all:
        return _allCode;
      default:
        return _allCode;
    }
  }

  /// User friendly text
  String getDisplayText(BuildContext context) {
    switch (this) {
      case WaterSupplyTypeEnum.underWater:
        return 'ក្រោមទឹក';
      case WaterSupplyTypeEnum.onTheWater:
        return 'លើទឹក';
      case WaterSupplyTypeEnum.springWater:
        return 'ទឹកផុស';
      case WaterSupplyTypeEnum.all:
        return 'ប្រើរួម';
      default:
        return 'ប្រើរួម';
    }
  }
}