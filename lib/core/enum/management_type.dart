import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

const int _associationCode = 0;
const int _privateCode = 1;

enum ManagementTypeEnum {
  @JsonValue(_associationCode)
  association,
  @JsonValue(_privateCode)
  private,
}

extension ManagementTypeEnumExtension on ManagementTypeEnum {
  int getCode() {
    switch (this) {
      case ManagementTypeEnum.association:
        return _associationCode;
      case ManagementTypeEnum.private:
        return _privateCode;
    }
  }

  /// User friendly text
  String getDisplayText() {
    switch (this) {
      case ManagementTypeEnum.association:
        return S.current.community;
      case ManagementTypeEnum.private:
        return S.current.private;
    }
  }
}

ManagementTypeEnum? getManagementTypeEnumById(int id) {
  switch (id) {
    case 0:
      return ManagementTypeEnum.association;
    case 1:
      return ManagementTypeEnum.private;
  }
  return null;
}

String getManagementTypeEnumDisplayText(ManagementTypeEnum value) {
  switch (value) {
    case ManagementTypeEnum.association:
      return 'សមាគមន៍';
    case ManagementTypeEnum.private:
      return 'ឯកជន';
  }
}
