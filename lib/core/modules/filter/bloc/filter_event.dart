part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterStarted extends FilterEvent {
  const FilterStarted();
}

class WaterSupplyCodeChanged extends FilterEvent {
  const WaterSupplyCodeChanged(this.waterSupplyCode);

  final String waterSupplyCode;
  @override
  List<Object> get props => [waterSupplyCode];
}
