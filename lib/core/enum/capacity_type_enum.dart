import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';
const int _ml35Code = 0;
const int _ml10Code = 1;
const int _ml5Code = 2;
const int _ml4Code = 3;
const int _ml1Code = 4;

enum CapacityTypeEnum {
  @JsonValue(_ml35Code)
  ml35,
  @JsonValue(_ml10Code)
  ml10,
  @JsonValue(_ml5Code)
  ml5,
  @JsonValue(_ml4Code)
  ml4,
  @JsonValue(_ml1Code)
  ml1,
}

extension CapacityTypeEnumExtension on CapacityTypeEnum {
  int getCode() {
    switch (this) {
      case CapacityTypeEnum.ml35:
        return _ml35Code;
      case CapacityTypeEnum.ml10:
        return _ml10Code;
      case CapacityTypeEnum.ml5:
        return _ml5Code;
      case CapacityTypeEnum.ml4:
        return _ml4Code;
      case CapacityTypeEnum.ml1:
        return _ml1Code;
      default:
        return _ml35Code;
    }
  }

  /// User friendly text
  String getDisplayText() {
    switch (this) {
      case CapacityTypeEnum.ml35:
        return S.current.thirty_five_m3;
      case CapacityTypeEnum.ml10:
        return S.current.ten_m3;
      case CapacityTypeEnum.ml5:
        return S.current.five_m3;
      case CapacityTypeEnum.ml4:
        return S.current.four_m3;
      case CapacityTypeEnum.ml1:
        return S.current.one_m3_giant_jar;
      default:
        return S.current.thirty_five_m3;
    }
  }
}

CapacityTypeEnum? getCapacityTypeEnumById(int id){
  switch (id) {
      case 45:
        return CapacityTypeEnum.ml35;
      case 46:
        return CapacityTypeEnum.ml10;
      case 47:
        return CapacityTypeEnum.ml5;
      case 48:
        return CapacityTypeEnum.ml4;
      case 49:
        return CapacityTypeEnum.ml1;
      default:
        return CapacityTypeEnum.ml1;
    }
}

String getCapacityTypeEnumDisplayText(CapacityTypeEnum? value) {
    switch (value) {
      case CapacityTypeEnum.ml35:
        return '៣៥ ម៣';
      case CapacityTypeEnum.ml10:
        return '១០ ម៣';
      case CapacityTypeEnum.ml5:
        return '៥ ម៣';
      case CapacityTypeEnum.ml4:
        return '៤ ម៣';
      case CapacityTypeEnum.ml1:
        return '១ ម៣ ពាងយក្ស';
      default:
        return '៣៥ ម៣';
    }
  }