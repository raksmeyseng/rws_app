import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_theme_options.g.dart';

@JsonSerializable()
class AppThemeOptions extends Equatable {
  const AppThemeOptions({
    this.primaryColorHex,
    this.fontFamily,
  });

  final String? primaryColorHex;
  final String? fontFamily;

  @override
  List<Object?> get props => [primaryColorHex, fontFamily];

  AppThemeOptions copyWith({String? primaryColorHex, String? fontFamily}) {
    return AppThemeOptions(
      primaryColorHex: primaryColorHex ?? this.primaryColorHex,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  factory AppThemeOptions.fromJson(Map<String, dynamic> json) =>
      _$AppThemeOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$AppThemeOptionsToJson(this);
}
