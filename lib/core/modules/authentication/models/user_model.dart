import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.username,
    this.email,
    this.isDataEntry,
    this.isHeadDepartment,
    this.isProvincialDepartmentHead,
    this.isDataVerifier1,
    this.isDataVerifier2,
    this.isPartner,
    this.dataEntryProvinceId,
    this.provincialDepartmentHeadProvinceId,
    this.firstName,
    this.lastName,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'is_data_entry')
  final bool? isDataEntry;
  @JsonKey(name: 'is_head_department')
  final bool? isHeadDepartment;
  @JsonKey(name: 'is_provincial_department_head')
  final bool? isProvincialDepartmentHead;
  @JsonKey(name: 'is_data_verifier_1')
  final bool? isDataVerifier1;
  @JsonKey(name: 'is_data_verifier_2')
  final bool? isDataVerifier2;
  @JsonKey(name: 'is_partner')
  final bool? isPartner;
  @JsonKey(name: 'data_entry_province_id')
  final int? dataEntryProvinceId;
  @JsonKey(name: 'provincial_department_head_province_id')
  final int? provincialDepartmentHeadProvinceId;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        isDataEntry,
        isHeadDepartment,
        isProvincialDepartmentHead,
        isDataVerifier1,
        isDataVerifier2,
        isPartner,
        dataEntryProvinceId,
        provincialDepartmentHeadProvinceId,
        firstName,
        lastName,
      ];

  UserModel copyWith({
    int? id,
    String? username,
    String? email,
    bool? isDataEntry,
    bool? isHeadDepartment,
    bool? isProvincialDepartmentHead,
    bool? isDataVerifier1,
    bool? isDataVerifier2,
    bool? isPartner,
    int? dataEntryProvinceId,
    int? provincialDepartmentHeadProvinceId,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      isDataEntry: isDataEntry ?? this.isDataEntry,
      isHeadDepartment: isHeadDepartment ?? this.isHeadDepartment,
      isProvincialDepartmentHead:
          isProvincialDepartmentHead ?? this.isProvincialDepartmentHead,
      isDataVerifier1: isDataVerifier1 ?? this.isDataVerifier1,
      isDataVerifier2: isDataVerifier2 ?? this.isDataVerifier2,
      isPartner: isPartner ?? this.isPartner,
      dataEntryProvinceId: dataEntryProvinceId ?? this.dataEntryProvinceId,
      provincialDepartmentHeadProvinceId: provincialDepartmentHeadProvinceId ??
          this.provincialDepartmentHeadProvinceId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
