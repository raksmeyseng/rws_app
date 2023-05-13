import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _familyCode = 0;
const int _schoolCode = 1;
const int _hospitalCode = 2;

enum UsingTypeEnum {
  @JsonValue(_familyCode)
  family,
  @JsonValue(_schoolCode)
  school,
  @JsonValue(_hospitalCode)
  hospital,
}

extension UsingTypeEnumExtension on UsingTypeEnum {
  int getCode() {
    switch (this) {
      case UsingTypeEnum.family:
        return _familyCode;
      case UsingTypeEnum.school:
        return _schoolCode;
      case UsingTypeEnum.hospital:
        return _hospitalCode;
    }
  }

  String getDisplayText(BuildContext context) {
    switch (this) {
      case UsingTypeEnum.family:
        return 'តាមគ្រួសារ';
      case UsingTypeEnum.school:
        return 'សាលារៀន';
      case UsingTypeEnum.hospital:
        return 'មន្ទីរពេទ្យ';
    }
  }
}
