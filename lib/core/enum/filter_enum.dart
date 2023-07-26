import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _haveCode = 0;
const int _notHaveCode = 1;

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

  String getDisplayText() {
    switch (this) {
      case FilterEnum.have:
        return 'មាន';
      case FilterEnum.notHave:
        return 'មិនមាន';
    }
  }
}
