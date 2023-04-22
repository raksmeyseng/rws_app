part of 'water_supply_bloc.dart';

class WaterSupplyState extends Equatable {
  const WaterSupplyState._({
    this.status = BaseStatusEnum.initial,
    this.waterSupply = const [],
  });

  final BaseStatusEnum status;
  final List<WaterSupplyTypeModel> waterSupply;

  const WaterSupplyState.initial() : this._();

  WaterSupplyState copyWith({
    BaseStatusEnum? status,
    List<WaterSupplyTypeModel>? waterSupply,
  }) {
    return WaterSupplyState._(
      status: status ?? this.status,
      waterSupply: waterSupply ?? this.waterSupply,
    );
  }

  @override
  List<Object?> get props => [status, waterSupply];
}
