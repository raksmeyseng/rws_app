part of 'water_supply_detials_bloc.dart';

class WaterSupplyDetialsState extends Equatable {
  const WaterSupplyDetialsState._({
    this.status = BaseStatusEnum.initial,
    this.waterSupply = const [],
    this.waterSupplyId = 0,
  });

  final BaseStatusEnum status;
  final List<WaterSupplyModel> waterSupply;
  final int waterSupplyId;

  const WaterSupplyDetialsState.initial({required int id})
      : this._(waterSupplyId: id);

  WaterSupplyDetialsState copyWith({
    BaseStatusEnum? status,
    List<WaterSupplyModel>? waterSupply,
  }) {
    return WaterSupplyDetialsState._(
      status: status ?? this.status,
      waterSupply: waterSupply ?? this.waterSupply,
    );
  }

  @override
  List<Object?> get props => [status, waterSupply];
}
