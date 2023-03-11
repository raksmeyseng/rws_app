import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

const int _maleCode = 1;
const int _femaleCode = 2;
const int _otherCode = 3;

enum GenderEnum {
  @JsonValue(_femaleCode)
  female,
  @JsonValue(_maleCode)
  male,
  @JsonValue(_otherCode)
  other,
}

extension GenderEnumExtension on GenderEnum {
  int getCode() {
    switch (this) {
      case GenderEnum.female:
        return _femaleCode;
      case GenderEnum.male:
        return _maleCode;
      case GenderEnum.other:
        return _otherCode;
    }
  }

  /// User friendly text
  String getDisplayText(BuildContext context) {
    switch (this) {
      case GenderEnum.female:
        return S.of(context).gender_female;
      case GenderEnum.male:
        return S.of(context).gender_male;
      case GenderEnum.other:
        return S.of(context).gender_other;
    }
  }

  /// Return PNG icon path
  String getIconPath() {
    switch (this) {
      case GenderEnum.female:
        return AssetPath.iconGenderFemale;
      case GenderEnum.male:
        return AssetPath.iconGenderMale;
      case GenderEnum.other:
        return AssetPath.iconGenderBigender;
    }
  }

  /// Gender indicator color
  Color getColor() {
    switch (this) {
      case GenderEnum.female:
        return Colors.pink;
      case GenderEnum.male:
        return Colors.blue;
      case GenderEnum.other:
        return Colors.purple;
    }
  }
}
