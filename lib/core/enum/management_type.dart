import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _associationCode = 1;
const int _privateCode = 2;

enum ManagementTypeEnum {
  @JsonValue(_associationCode)
  association,
  @JsonValue(_privateCode)
  private,
}

extension ManagementTypeEnumExtension on ManagementTypeEnum {
  int getCode() {
    switch (this) {
      case ManagementTypeEnum.association:
        return _associationCode;
      case ManagementTypeEnum.private:
        return _privateCode;
    }
  }

  /// User friendly text
  String getDisplayText(BuildContext context) {
    switch (this) {
      case ManagementTypeEnum.association:
        return 'សមាគមន៍';
      case ManagementTypeEnum.private:
        return 'ឯកជន';
    }
  }
}
