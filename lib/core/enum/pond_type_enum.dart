import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _concreteCode = 0;
const int _landCode = 1;

enum PondTypeEnum {
  @JsonValue(_concreteCode)
  concrete,
  @JsonValue(_landCode)
  land,
}

extension PondTypeEnumExtension on PondTypeEnum {
  int getCode() {
    switch (this) {
      case PondTypeEnum.concrete:
        return _concreteCode;
      case PondTypeEnum.land:
        return _landCode;
    }
  }

  String getDisplayText(BuildContext context) {
    switch (this) {
      case PondTypeEnum.concrete:
        return 'ជើងទេរបេតុង';
      case PondTypeEnum.land:
        return 'ជើងទេរដី';
    }
  }
}
