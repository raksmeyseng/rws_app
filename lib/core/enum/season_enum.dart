import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _haveCode = 0;
const int _notHaveCode = 1;

enum SeasonEnum {
  @JsonValue(_haveCode)
  have,
  @JsonValue(_notHaveCode)
  notHave,
}

extension SeasonEnumExtension on SeasonEnum {
  int getCode() {
    switch (this) {
      case SeasonEnum.have:
        return _haveCode;
      case SeasonEnum.notHave:
        return _notHaveCode;
    }
  }

  String getDisplayText(BuildContext context) {
    switch (this) {
      case SeasonEnum.have:
        return 'មានទឹក';
      case SeasonEnum.notHave:
        return 'គ្មានទឹក';
    }
  }
}
