import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

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
        return S.current.active_status;
      case WellStatusEnum.inActive:
        return S.current.inactive_status;
    }
  }
}

WellStatusEnum? getWellStatusEnumById(int id) {
  switch (id) {
    case 12:
      return WellStatusEnum.active;
    case 13:
      return WellStatusEnum.inActive;
  }
  return null;
}

String getWellStatusEnumDisplayText(WellStatusEnum value) {
  switch (value) {
    case WellStatusEnum.active:
      return 'ដំណើរការ';
    case WellStatusEnum.inActive:
      return 'មិនដំណើរការ';
  }
}
