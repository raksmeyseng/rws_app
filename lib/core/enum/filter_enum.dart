import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _haveCode = 1;
const int _notHaveCode = 2;

enum FilterEnum {
  @JsonValue(_haveCode)
  have,
  @JsonValue(_notHaveCode)
  notHave,
}

extension FilterEnumExtension on FilterEnum {
  int getCode() {
    switch (this) {
      case FilterEnum.have:
        return _haveCode;
      case FilterEnum.notHave:
        return _notHaveCode;
    }
  }

  String getDisplayText(BuildContext context) {
    switch (this) {
      case FilterEnum.have:
        return 'មាន';
      case FilterEnum.notHave:
        return 'មិនមាន';
    }
  }
}
