import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/translation/generated/l10n.dart';

const int _familyCode = 0;
const int _schoolCode = 1;
const int _hospitalCode = 2;

enum UsingTypeEnum {
  @JsonValue(_familyCode)
  family,
  @JsonValue(_schoolCode)
  school,
  @JsonValue(_hospitalCode)
  hospital,
}

extension UsingTypeEnumExtension on UsingTypeEnum {
  int getCode() {
    switch (this) {
      case UsingTypeEnum.family:
        return _familyCode;
      case UsingTypeEnum.school:
        return _schoolCode;
      case UsingTypeEnum.hospital:
        return _hospitalCode;
    }
  }

  //String getDisplayText(BuildContext context)
  String getDisplayText() {
    switch (this) {
      case UsingTypeEnum.family:
        return S.current.family;
      case UsingTypeEnum.school:
        return S.current.school;
      case UsingTypeEnum.hospital:
        return S.current.hospital;
    }
  }
}

UsingTypeEnum? getUsingTypeEnumById(int id) {
  switch (id) {
    case 39:
      return UsingTypeEnum.family;
    case 40:
      return UsingTypeEnum.school;
    case 41:
      return UsingTypeEnum.hospital;
  }
  return null;
}

String getUsingTypeEnumDisplayText(UsingTypeEnum value) {
  switch (value) {
    case UsingTypeEnum.family:
      return 'តាមគ្រួសារ';
    case UsingTypeEnum.school:
      return 'សាលារៀន';
    case UsingTypeEnum.hospital:
      return 'មន្ទីរពេទ្យ';
  }
}
