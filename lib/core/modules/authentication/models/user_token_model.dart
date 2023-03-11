import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_token_model.g.dart';

@JsonSerializable()
class UserTokenModel extends Equatable {
  const UserTokenModel({
    this.issuer,
    required this.userId,
    required this.token,
    required this.refreshToken,
    required this.tokenExpireTime,
  });

  final String? issuer;
  final int userId;
  final String token;
  final String refreshToken;
  final DateTime tokenExpireTime;

  factory UserTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UserTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenModelToJson(this);

  @override
  List<Object?> get props => [
        issuer,
        userId,
        token,
        refreshToken,
        tokenExpireTime,
      ];
}
