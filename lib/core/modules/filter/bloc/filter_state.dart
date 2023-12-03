part of 'filter_bloc.dart';

class FilterState extends Equatable {
  const FilterState._({
    this.status = BaseStatusEnum.initial,
    this.waterSupplyTypeId = 1,
    this.waterSupplyCodeInput = const WaterSupplyInput.pure(),
  });

  final BaseStatusEnum status;
  final int waterSupplyTypeId;
  final WaterSupplyInput waterSupplyCodeInput;

  const FilterState.initial({required int waterSupplyTypeId})
      : this._(waterSupplyTypeId: waterSupplyTypeId);

  FilterState copyWith({
    BaseStatusEnum? status,
    int? waterSupplyTypeId,
    WaterSupplyInput? waterSupplyCodeInput,
  }) {
    return FilterState._(
        status: status ?? this.status,
        waterSupplyTypeId: waterSupplyTypeId ?? this.waterSupplyTypeId,
        waterSupplyCodeInput:
            waterSupplyCodeInput ?? this.waterSupplyCodeInput);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, waterSupplyTypeId, waterSupplyCodeInput];
}
