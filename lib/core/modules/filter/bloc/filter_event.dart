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

class ProvinceChanged extends FilterEvent {
  const ProvinceChanged(this.province);

  final ProvinceModel province;

  @override
  List<Object> get props => [province];
}

class DistrictChanged extends FilterEvent {
  const DistrictChanged(this.district);

  final DistrictModel district;

  @override
  List<Object> get props => [district];
}

class CommnueChanged extends FilterEvent {
  const CommnueChanged(this.commnue);

  final CommuneModel commnue;

  @override
  List<Object> get props => [commnue];
}

class VillageChanged extends FilterEvent {
  const VillageChanged(this.village);

  final VillageModel village;

  @override
  List<Object> get props => [village];
}
