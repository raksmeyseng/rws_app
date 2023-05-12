import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _notHaveCode = 0;
const int _haveActiveCode = 1;
const int _haveInactiveCode = 2;

enum PondFilterEnum {
  @JsonValue(_notHaveCode)
  notHave,
  @JsonValue(_haveActiveCode)
  haveActive,
  @JsonValue(_haveInactiveCode)
  haveInactive,
}

extension PondFilterEnumExtension on PondFilterEnum {
  int getCode() {
    switch (this) {
      case PondFilterEnum.notHave:
        return _notHaveCode;
      case PondFilterEnum.haveActive:
        return _haveActiveCode;
      case PondFilterEnum.haveInactive:
        return _haveInactiveCode;
    }
  }

  String getDisplayText(BuildContext context) {
    switch (this) {
      case PondFilterEnum.notHave:
        return 'មិនមាន';
      case PondFilterEnum.haveActive:
        return 'មាន(ដំណើរការ)';
      case PondFilterEnum.haveInactive:
        return 'មាន(មិនដំណើរការ)';
    }
  }
}
