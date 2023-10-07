import 'package:json_annotation/json_annotation.dart';

const int _underWaterCode = 14;
const int _onTheWaterCode = 15;
const int _springWaterCode = 16;
const int _allCode = 17;

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
  String getDisplayText() {
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

WaterSupplyTypeEnum? getWaterSupplyTypeEnumById(int id){
  switch (id) {
      case 14:
        return WaterSupplyTypeEnum.underWater;
      case 15:
        return WaterSupplyTypeEnum.onTheWater;
      case 16:
        return WaterSupplyTypeEnum.springWater;
      case 17:
        return WaterSupplyTypeEnum.all;
      default:
        return WaterSupplyTypeEnum.all;
    }
}

String getWaterSupplyTypeEnumDisplayText(WaterSupplyTypeEnum value) {
    switch (value) {
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