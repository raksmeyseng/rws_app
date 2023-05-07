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

class ManagementNameChanged extends WaterSupplyEditEvent {
  const ManagementNameChanged(this.managementName);

  final String managementName;

  @override
  List<Object> get props => [managementName];
}

class ReceiverTotalChanged extends WaterSupplyEditEvent {
  const ReceiverTotalChanged(this.receiverTotal);

  final String receiverTotal;

  @override
  List<Object> get props => [receiverTotal];
}

class ReceiverTotalAsFemaleChanged extends WaterSupplyEditEvent {
  const ReceiverTotalAsFemaleChanged(this.receiverTotalAsFemale);

  final String receiverTotalAsFemale;

  @override
  List<Object> get props => [receiverTotalAsFemale];
}

class ReceiverFamilyTotalChanged extends WaterSupplyEditEvent {
  const ReceiverFamilyTotalChanged(this.receiverFamilyTotal);

  final String receiverFamilyTotal;

  @override
  List<Object> get props => [receiverFamilyTotal];
}

class ReceiverFamilyPoor1Changed extends WaterSupplyEditEvent {
  const ReceiverFamilyPoor1Changed(this.receiverFamilyPoor1);

  final String receiverFamilyPoor1;

  @override
  List<Object> get props => [receiverFamilyPoor1];
}

class ReceiverFamilyPoor2Changed extends WaterSupplyEditEvent {
  const ReceiverFamilyPoor2Changed(this.receiverFamilyPoor2);

  final String receiverFamilyPoor2;

  @override
  List<Object> get props => [receiverFamilyPoor2];
}

class ReceiverFamilyMinorityChanged extends WaterSupplyEditEvent {
  const ReceiverFamilyMinorityChanged(this.receiverFamilyMinority);

  final String receiverFamilyMinority;

  @override
  List<Object> get props => [receiverFamilyMinority];
}

class ReceiverFamilyVictimChanged extends WaterSupplyEditEvent {
  const ReceiverFamilyVictimChanged(this.receiverFamilyVictim);

  final String receiverFamilyVictim;

  @override
  List<Object> get props => [receiverFamilyVictim];
}

class DOCChanged extends WaterSupplyEditEvent {
  const DOCChanged(this.doc);

  final DateTime doc;

  @override
  List<Object> get props => [doc];
}

class CompanyNameChanged extends WaterSupplyEditEvent {
  const CompanyNameChanged(this.companyName);

  final String companyName;

  @override
  List<Object> get props => [companyName];
}

class ConstructionCodeChanged extends WaterSupplyEditEvent {
  const ConstructionCodeChanged(this.constructionCode);

  final String constructionCode;

  @override
  List<Object> get props => [constructionCode];
}

class WaterSupplyTypeChanged extends WaterSupplyEditEvent {
  const WaterSupplyTypeChanged(this.waterSupplyType);

  final String waterSupplyType;

  @override
  List<Object> get props => [waterSupplyType];
}

class ContainerChanged extends WaterSupplyEditEvent {
  const ContainerChanged(this.container);

  final String container;

  @override
  List<Object> get props => [container];
}

class CapacityChanged extends WaterSupplyEditEvent {
  const CapacityChanged(this.capacity);

  final String capacity;

  @override
  List<Object> get props => [capacity];
}

class WellTypeChanged extends WaterSupplyEditEvent {
  const WellTypeChanged(this.wellType);

  final String wellType;

  @override
  List<Object> get props => [wellType];
}

class WellDepthChanged extends WaterSupplyEditEvent {
  const WellDepthChanged(this.wellDepth);

  final String wellDepth;

  @override
  List<Object> get props => [wellDepth];
}
