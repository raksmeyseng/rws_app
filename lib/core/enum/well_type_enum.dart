import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';

const int _motorCode = 1;
const int _pumpCode = 2;
const int _markIICode = 3;
const int _markIIICode = 4;
const int _pump6Code = 5;
const int _drainageCode = 6;
const int _mixedCode = 7;

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
  String getDisplayText() {
    switch (this) {
      case WellTypeEnum.motor:
        return S.current.motorized_pump_well;
      case WellTypeEnum.pump:
        return S.current.afridef_pump_well;
      case WellTypeEnum.markII:
        return  S.current.mark_II_well;
      case WellTypeEnum.markIII:
        return S.current.mark_III_well;
      case WellTypeEnum.pump6:
        return S.current.no_6_pump_well;
      case WellTypeEnum.drainage:
        return S.current.drainage_well;
      case WellTypeEnum.mixed:
        return S.current.mixed_wells;
      default:
        return S.current.mixed_wells;
    }
  }

  

}
WellTypeEnum? getWellTypeEnumById(int id){
    switch (id) {
      case 1:
        return WellTypeEnum.motor;
      case 2:
        return WellTypeEnum.pump;
      case 3:
        return WellTypeEnum.markII;
      case 4:
        return WellTypeEnum.markIII;
      case 5:
        return WellTypeEnum.pump6;
      case 6:
        return WellTypeEnum.drainage;
      case 7:
        return WellTypeEnum.mixed;
      default:
        return WellTypeEnum.mixed;
    }
  }

  /// User friendly text
  String getWellTypeDisplayText(WellTypeEnum value) {
    switch (value) {
      case WellTypeEnum.motor:
        return 'អណ្ដូងបូមដោយម៉ូទ័រ';
      case WellTypeEnum.pump:
        return 'អណ្ដូងស្នប់អាហ្វ្រីដេហ្វ';
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

