part of 'view_details_bloc.dart';


abstract class WaterSupplyViewDetailEvent extends Equatable{
  const WaterSupplyViewDetailEvent();

  @override
  List<Object> get props => [];
}

class WaterSupplyViewDetailStarted extends WaterSupplyViewDetailEvent {
  const WaterSupplyViewDetailStarted();
}