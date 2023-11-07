part of 'water_supply_detials_bloc.dart';

class WaterSupplyDetialsState extends Equatable {
  const WaterSupplyDetialsState._({
    this.status = BaseStatusEnum.initial,
    this.waterSupply = const [],
    this.waterSupplyId = 0,
  });

  final BaseStatusEnum status;
  final List<WaterSupplyListByTypeModel> waterSupply;
  final int waterSupplyId;

  const WaterSupplyDetialsState.initial({required int waterSupplyId})
      : this._(waterSupplyId: waterSupplyId);

  WaterSupplyDetialsState copyWith({
    BaseStatusEnum? status,
    List<WaterSupplyListByTypeModel>? waterSupply,
    int? waterSupplyId,
  }) {
    return WaterSupplyDetialsState._(
      status: status ?? this.status,
      waterSupply: waterSupply ?? this.waterSupply,
      waterSupplyId: waterSupplyId ?? this.waterSupplyId,
    );
  }

  @override
  List<Object?> get props => [
        status,
        waterSupply,
        waterSupplyId,
      ];
}
