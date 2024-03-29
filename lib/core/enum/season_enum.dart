import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

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

  String getDisplayText() {
    switch (this) {
      case SeasonEnum.have:
        return S.current.have_water;
      case SeasonEnum.notHave:
        return S.current.no_water;
    }
  }
}

SeasonEnum? getSeasonEnumbyId(int id) {
  switch (id) {
    case 34:
      return SeasonEnum.have;
    case 35:
      return SeasonEnum.notHave;
  }
  return null;
}

String getSeasonEnumDisplayText(SeasonEnum value) {
  switch (value) {
    case SeasonEnum.have:
      return 'មានទឹក';
    case SeasonEnum.notHave:
      return 'គ្មានទឹក';
  }
}
