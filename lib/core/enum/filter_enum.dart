import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

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
        return S.current.have;
      case FilterEnum.notHave:
        return S.current.nohave;
    }
  }
}

FilterEnum? getFilterEnumById(int id) {
  switch (id) {
    case 18:
      return FilterEnum.have;
    case 19:
      return FilterEnum.notHave;
  }
  return null;
}

String getFilterEnumDisplayText(FilterEnum value) {
  switch (value) {
    case FilterEnum.have:
      return 'មាន';
    case FilterEnum.notHave:
      return 'មិនមាន';
  }
}
