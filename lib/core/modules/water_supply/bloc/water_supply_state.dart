part of 'water_supply_bloc.dart';

class WaterSupplyState extends Equatable {
  const WaterSupplyState._({
    this.status = BaseStatusEnum.initial,
  });

  final BaseStatusEnum status;

  const WaterSupplyState.initial() : this._();

  WaterSupplyState copyWith({
    BaseStatusEnum? status,
  }) {
    return WaterSupplyState._(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
