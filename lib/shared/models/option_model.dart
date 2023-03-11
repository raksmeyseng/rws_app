import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option_model.g.dart';

@JsonSerializable()
class OptionModel extends Equatable {
  const OptionModel({
    required this.id,
    required this.name,
  });

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;

  @override
  List<Object?> get props => [id, name];

  static const empty = OptionModel(id: 0, name: '');

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OptionModelToJson(this);
}
