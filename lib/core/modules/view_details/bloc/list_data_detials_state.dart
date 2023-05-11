part of 'list_data_details_bloc.dart';

class ListDataDetailsState extends Equatable {
  const ListDataDetailsState._({
    this.status = BaseStatusEnum.initial,
    this.waterSupply,
    this.waterSupplyId = 0,
  });

  final BaseStatusEnum status;
  final WaterSupplyModel? waterSupply;
  final int waterSupplyId;

  const ListDataDetailsState.initial({required int waterSupplyId})
      : this._(waterSupplyId: waterSupplyId);

  ListDataDetailsState copyWith({
    BaseStatusEnum? status,
    WaterSupplyModel? waterSupply,
    int? waterSupplyId,
  }) {
    return ListDataDetailsState._(
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
