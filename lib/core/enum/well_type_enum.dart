import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _motorCode = 0;
const int _pumpCode = 1;
const int _markIICode = 2;
const int _markIIICode = 3;
const int _pump6Code = 4;
const int _drainageCode = 5;
const int _mixedCode = 6;

enum WellTypeEnum {
  @JsonValue(_motorCode)
  motor,
  @JsonValue(_pumpCode)
  pump,
  @JsonValue(_markIICode)
  markII,
  @JsonValue(_markIIICode)
  markIII,
  @JsonValue(_pump6Code)
  pump6,
  @JsonValue(_drainageCode)
  drainage,
  @JsonValue(_mixedCode)
  mixed,
}

extension WellTypeEnumExtension on WellTypeEnum {
  int getCode() {
    switch (this) {
      case WellTypeEnum.motor:
        return _motorCode;
      case WellTypeEnum.pump:
        return _pumpCode;
      case WellTypeEnum.markII:
        return _markIICode;
      case WellTypeEnum.markIII:
        return _markIIICode;
      case WellTypeEnum.pump6:
        return _pump6Code;
      case WellTypeEnum.drainage:
        return _drainageCode;
      case WellTypeEnum.mixed:
        return _mixedCode;
      default:
        return _mixedCode;
    }
  }

  /// User friendly text
  String getDisplayText(BuildContext context) {
    switch (this) {
      case WellTypeEnum.motor:
        return 'អណ្ដូងបូមដោយម៉ូទ័រ';
      case WellTypeEnum.pump:
        return 'អណ្ដូងស្នប់អាហ្វ្រីដេហ្';
      case WellTypeEnum.markII:
        return 'អណ្ដូងMark II';
      case WellTypeEnum.markIII:
        return 'អណ្ដូងMark III';
      case WellTypeEnum.pump6:
        return 'អណ្ដូងស្នប់លេខ៦';
      case WellTypeEnum.drainage:
        return 'អណ្ដូងលូ';
      case WellTypeEnum.mixed:
        return 'អណ្ដូងចំរុះ';
      default:
        return 'អណ្ដូងចំរុះ';
    }
  }
}
