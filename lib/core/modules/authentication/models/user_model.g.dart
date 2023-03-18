// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String?,
      isDataEntry: json['is_data_entry'] as bool?,
      isHeadDepartment: json['is_head_department'] as bool?,
      isProvincialDepartmentHead:
          json['is_provincial_department_head'] as bool?,
      isDataVerifier1: json['is_data_verifier_1'] as bool?,
      isDataVerifier2: json['is_data_verifier_2'] as bool?,
      isPartner: json['is_partner'] as bool?,
      dataEntryProvinceId: json['data_entry_province_id'] as int?,
      provincialDepartmentHeadProvinceId:
          json['provincial_department_head_province_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'is_data_entry': instance.isDataEntry,
      'is_head_department': instance.isHeadDepartment,
      'is_provincial_department_head': instance.isProvincialDepartmentHead,
      'is_data_verifier_1': instance.isDataVerifier1,
      'is_data_verifier_2': instance.isDataVerifier2,
      'is_partner': instance.isPartner,
      'data_entry_province_id': instance.dataEntryProvinceId,
      'provincial_department_head_province_id':
          instance.provincialDepartmentHeadProvinceId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
