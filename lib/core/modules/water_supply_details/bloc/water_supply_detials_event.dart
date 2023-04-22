part of 'water_supply_detials_bloc.dart';

abstract class WaterSupplyDetialsEvent extends Equatable {
  const WaterSupplyDetialsEvent();

  @override
  List<Object> get props => [];
}

class WaterSupplyStarted extends WaterSupplyDetialsEvent {
  const WaterSupplyStarted();
}
