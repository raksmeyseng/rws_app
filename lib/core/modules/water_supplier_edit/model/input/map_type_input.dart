import 'package:formz/formz.dart';
import 'package:rws_app/core/enum/map_type_enum.dart';

enum MapTypeInputValidationError { empty }

class MapTypeInput
    extends FormzInput<MapTypeEnum?, MapTypeInputValidationError> {
  const MapTypeInput.pure([MapTypeEnum? value]) : super.pure(value);
  const MapTypeInput.dirty([MapTypeEnum? value]) : super.dirty(value);

  @override
  MapTypeInputValidationError? validator(MapTypeEnum? value) {
    if (value == null) {
      return MapTypeInputValidationError.empty;
    }

    return null;
  }
}