import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rws_app/core/modules/authentication/models/user_model.dart';

part 'user_token_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserTokenModel extends Equatable {
  const UserTokenModel({
    required this.data,
    required this.user,
  });

  @JsonKey(name: 'data')
  final DataModel data;
  @JsonKey(name: 'user')
  final UserModel user;

  factory UserTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UserTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenModelToJson(this);

  @override
  List<Object?> get props => [user, data];
}

@JsonSerializable()
class DataModel extends Equatable {
  const DataModel({
    required this.expiry,
    required this.token,
  });

  @JsonKey(name: 'expiry')
  final DateTime expiry;
  @JsonKey(name: 'token')
  final String token;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  @override
  List<Object?> get props => [expiry, token];
}
