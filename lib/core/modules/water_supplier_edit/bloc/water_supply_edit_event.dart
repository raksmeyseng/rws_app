part of 'water_supply_edit_bloc.dart';

abstract class WaterSupplyEditEvent extends Equatable {
  const WaterSupplyEditEvent();

  @override
  List<Object> get props => [];
}

class WaterSupplyStarted extends WaterSupplyEditEvent {
  const WaterSupplyStarted();
}

class ProvinceChanged extends WaterSupplyEditEvent {
  const ProvinceChanged(this.province);

  final String province;

  @override
  List<Object> get props => [province];
}

class DistrictChanged extends WaterSupplyEditEvent {
  const DistrictChanged(this.district);

  final String district;

  @override
  List<Object> get props => [district];
}

class CommnueChanged extends WaterSupplyEditEvent {
  const CommnueChanged(this.commnue);

  final String commnue;

  @override
  List<Object> get props => [commnue];
}

class VillageChanged extends WaterSupplyEditEvent {
  const VillageChanged(this.village);

  final String village;

  @override
  List<Object> get props => [village];
}

class MapTypeChanged extends WaterSupplyEditEvent {
  const MapTypeChanged(this.mapType);

  final String mapType;

  @override
  List<Object> get props => [mapType];
}

class LatetitudeChanged extends WaterSupplyEditEvent {
  const LatetitudeChanged(this.latetitude);

  final String latetitude;

  @override
  List<Object> get props => [latetitude];
}

class LongtitudeChanged extends WaterSupplyEditEvent {
  const LongtitudeChanged(this.longtitude);

  final String longtitude;

  @override
  List<Object> get props => [longtitude];
}

class FamilyTotalChanged extends WaterSupplyEditEvent {
  const FamilyTotalChanged(this.familyTotal);

  final String familyTotal;

  @override
  List<Object> get props => [familyTotal];
}

class LocationRickChanged extends WaterSupplyEditEvent {
  const LocationRickChanged(this.locationRick);

  final String locationRick;

  @override
  List<Object> get props => [locationRick];
}

class BudgetTypeChanged extends WaterSupplyEditEvent {
  const BudgetTypeChanged(this.budgetType);

  final String budgetType;

  @override
  List<Object> get props => [budgetType];
}

class ManagementTypeChanged extends WaterSupplyEditEvent {
  const ManagementTypeChanged(this.managementType);

  final String managementType;

  @override
  List<Object> get props => [managementType];
}

class ReceiverTotalChanged extends WaterSupplyEditEvent {
  const ReceiverTotalChanged(this.receiverTotal);

  final String receiverTotal;

  @override
  List<Object> get props => [receiverTotal];
}

class ReceiverFamilyTotalChanged extends WaterSupplyEditEvent {
  const ReceiverFamilyTotalChanged(this.receiverFamilyTotal);

  final String receiverFamilyTotal;

  @override
  List<Object> get props => [receiverFamilyTotal];
}

class ReceiverFamilyPoor2Changed extends WaterSupplyEditEvent {
  const ReceiverFamilyPoor2Changed(this.receiverFamilyPoor2);

  final String receiverFamilyPoor2;

  @override
  List<Object> get props => [receiverFamilyPoor2];
}
