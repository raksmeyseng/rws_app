part of 'view_details_bloc.dart';

class WaterSupplyViewDetailState extends Equatable{

  const WaterSupplyViewDetailState._({
    this.status = BaseStatusEnum.initial,
    this.waterSupply,
    this.waterSupplyId=0
});

  final BaseStatusEnum status;
  final WaterSupplyModel? waterSupply;
  final int waterSupplyId;

  const WaterSupplyViewDetailState.initial({required int id})
  :this._(waterSupplyId: id);
  WaterSupplyViewDetailState copyWith({
    BaseStatusEnum? status,
    WaterSupplyModel? waterSupply
}){
    return WaterSupplyViewDetailState._(
      status: status?? this.status,
      waterSupply: waterSupply ?? this.waterSupply,
    );
  }

@override
List<Object?> get props => [status,waterSupply];
}