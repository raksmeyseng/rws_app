part of 'water_supply_bloc.dart';

abstract class WaterSupplyEvent extends Equatable {
  const WaterSupplyEvent();

  @override
  List<Object> get props => [];
}

class WaterSupplyStarted extends WaterSupplyEvent {
  const WaterSupplyStarted();
}
