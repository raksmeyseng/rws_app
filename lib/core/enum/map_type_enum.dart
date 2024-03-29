import 'package:json_annotation/json_annotation.dart';

const int _utmCode = 1;
// const int _decimalCode = 2;
// const int _degreeCode = 3;

enum MapTypeEnum {
  @JsonValue(_utmCode)
  utm,
  // @JsonValue(_decimalCode)
  // decimal,
  // @JsonValue(_degreeCode)
  // degree,
}

extension MapTypeEnumExtension on MapTypeEnum {
  int getCode() {
    switch (this) {
      case MapTypeEnum.utm:
        return _utmCode;
      // case MapTypeEnum.decimal:
      //   return _decimalCode;
      // case MapTypeEnum.degree:
      //   return _degreeCode;
    }
  }

  /// User friendly text
  String getDisplayText() {
    switch (this) {
      case MapTypeEnum.utm:
        return 'UTM';
      // case MapTypeEnum.decimal:
      //   return 'Decimal Degress';
      // case MapTypeEnum.degree:
      //   return 'Degree Minutes Seconds';
    }
  }
}

MapTypeEnum? getEnumByString(String value) {
  switch (value) {
    case 'UTM':
      return MapTypeEnum.utm;
    // case 'Decimal Degress':
    //   return MapTypeEnum.decimal;
    // case 'Degree Minutes Seconds':
    //   return MapTypeEnum.degree;
    default:
      return null;
  }
}

MapTypeEnum? getMapTypeEnumById(int value) {
  switch (value) {
    case 1:
      return MapTypeEnum.utm;
    // case 2:
    //   return MapTypeEnum.decimal;
    // case 3:
    //   return MapTypeEnum.degree;
    default:
      return null;
  }
}

String getDisplayTextById(MapTypeEnum value) {
  switch (value) {
    case MapTypeEnum.utm:
      return 'UTM';
    // case MapTypeEnum.decimal:
    //   return 'Decimal Degress';
    // case MapTypeEnum.degree:
    //return 'Degree Minutes Seconds';
  }
}
