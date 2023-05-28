part of 'list_data_details_bloc.dart';

class ListDataDetailsState extends Equatable {
  const ListDataDetailsState._({
    this.status = BaseStatusEnum.initial,
    this.deleteStatus = BaseStatusEnum.initial,
    this.waterSupply,
    this.waterSupplyId = 0,
    this.mainStatus = 0,
  });

  final BaseStatusEnum status;
  final BaseStatusEnum deleteStatus;
  final WaterSupplyModel? waterSupply;
  final int waterSupplyId;
  final int? mainStatus;

  const ListDataDetailsState.initial({required int waterSupplyId})
      : this._(waterSupplyId: waterSupplyId);

  ListDataDetailsState copyWith({
    BaseStatusEnum? status,
    BaseStatusEnum? deleteStatus,
    WaterSupplyModel? waterSupply,
    int? waterSupplyId,
    int? mainStatus,
  }) {
    return ListDataDetailsState._(
      status: status ?? this.status,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      waterSupply: waterSupply ?? this.waterSupply,
      waterSupplyId: waterSupplyId ?? this.waterSupplyId,
      mainStatus: mainStatus ?? this.mainStatus,
    );
  }

  @override
  List<Object?> get props => [
        status,
        deleteStatus,
        waterSupply,
        waterSupplyId,
      ];
}
