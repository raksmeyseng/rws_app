import 'package:json_annotation/json_annotation.dart';

const int _activeCode = 0;
const int _inactiveCode = 1;

enum WellStatusEnum {
  @JsonValue(_activeCode)
  active,
  @JsonValue(_inactiveCode)
  inActive,
}

extension WellStatusEnumExtension on WellStatusEnum {
  int getCode() {
    switch (this) {
      case WellStatusEnum.active:
        return _activeCode;
      case WellStatusEnum.inActive:
        return _inactiveCode;
    }
  }

  String getDisplayText() {
    switch (this) {
      case WellStatusEnum.active:
        return 'ដំណើរការ';
      case WellStatusEnum.inActive:
        return 'មិនដំណើរការ';
    }
  }
}
