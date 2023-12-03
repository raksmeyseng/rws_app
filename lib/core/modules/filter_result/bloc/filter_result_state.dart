part of 'filter_result_bloc.dart';

class FilterResultState extends Equatable {
  const FilterResultState._({
    this.status = BaseStatusEnum.initial,
    this.waterSupplyTypeId = 1,
    this.waterSupplyCode = '',
    this.waterSupply = const [],
  });
  final BaseStatusEnum status;
  final int waterSupplyTypeId;
  final String waterSupplyCode;
  final List<WaterSupplyListByTypeModel> waterSupply;

  const FilterResultState.initial(
      {required int waterSupplyTypeId, required String waterSupplyCode})
      : this._(
            waterSupplyTypeId: waterSupplyTypeId,
            waterSupplyCode: waterSupplyCode);

  FilterResultState copyWith(
      {BaseStatusEnum? status,
      int? waterSupplyTypeId,
      List<WaterSupplyListByTypeModel>? waterSupply,
      String? waterSupplyCode}) {
    return FilterResultState._(
        status: status ?? this.status,
        waterSupplyTypeId: waterSupplyTypeId ?? this.waterSupplyTypeId,
        waterSupply: waterSupply ?? this.waterSupply,
        waterSupplyCode: waterSupplyCode ?? this.waterSupplyCode);
  }

  @override
  List<Object?> get props =>
      [status, waterSupplyTypeId, waterSupplyCode, waterSupply];
}
