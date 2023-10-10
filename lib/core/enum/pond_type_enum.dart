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

  String getDisplayText() {
    switch (this) {
      case PondTypeEnum.concrete:
        return 'ជើងទេរបេតុង';
      case PondTypeEnum.land:
        return 'ជើងទេរដី';
    }
  }
}

PondTypeEnum? getPondTypeEnumById(int id){
  switch (id) {
      case 32:
        return PondTypeEnum.concrete;
      case 33:
        return PondTypeEnum.land;
    }
}

String getPondTypeEnumDisplayText(PondTypeEnum value) {
    switch (value) {
      case PondTypeEnum.concrete:
        return 'ជើងទេរបេតុង';
      case PondTypeEnum.land:
        return 'ជើងទេរដី';
    }
  }