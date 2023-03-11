// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyModel _$CurrencyModelFromJson(Map<String, dynamic> json) =>
    CurrencyModel(
      id: json['id'] as int,
      name: json['name'] as String?,
      code: json['code'] as String,
      sign: json['sign'] as String,
      format: json['format'] as String,
      priceFormat: json['priceFormat'] as String?,
      digitLimit: json['digitLimit'] as int?,
    );

Map<String, dynamic> _$CurrencyModelToJson(CurrencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'sign': instance.sign,
      'format': instance.format,
      'priceFormat': instance.priceFormat,
      'digitLimit': instance.digitLimit,
    };
