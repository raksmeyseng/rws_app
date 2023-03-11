import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel extends Equatable {
  const CurrencyModel({
    required this.id,
    required this.name,
    required this.code,
    required this.sign,
    required this.format,
    this.priceFormat,
    this.digitLimit,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'sign')
  final String sign;
  @JsonKey(name: 'format')
  final String format;
  @JsonKey(name: 'priceFormat')
  final String? priceFormat;
  @JsonKey(name: 'digitLimit')
  final int? digitLimit;

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        sign,
        format,
        priceFormat,
        digitLimit,
      ];

  static const empty = CurrencyModel(
    id: 0,
    name: '',
    code: '',
    sign: '',
    format: '',
  );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}
