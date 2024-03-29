import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

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

  String getDisplayText() {
    switch (this) {
      case PondFilterEnum.notHave:
        return S.current.nohave;
      case PondFilterEnum.haveActive:
        return S.current.have_active;
      case PondFilterEnum.haveInactive:
        return S.current.have_inactive;
    }
  }
}

PondFilterEnum? getPondFilterEnumById(int id) {
  switch (id) {
    case 30:
      return PondFilterEnum.notHave;
    case 31:
      return PondFilterEnum.haveActive;
    case 44:
      return PondFilterEnum.haveInactive;
  }
  return null;
}

String getPondFilterEnumDisplayText(PondFilterEnum value) {
  switch (value) {
    case PondFilterEnum.notHave:
      return 'មិនមាន';
    case PondFilterEnum.haveActive:
      return 'មាន(ដំណើរការ)';
    case PondFilterEnum.haveInactive:
      return 'មាន(មិនដំណើរការ)';
  }
}
