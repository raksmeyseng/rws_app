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

  final ProvinceModel province;

  @override
  List<Object> get props => [province];
}

class DistrictChanged extends WaterSupplyEditEvent {
  const DistrictChanged(this.district);

  final DistrictModel district;

  @override
  List<Object> get props => [district];
}

class CommnueChanged extends WaterSupplyEditEvent {
  const CommnueChanged(this.commnue);

  final CommuneModel commnue;

  @override
  List<Object> get props => [commnue];
}

class VillageChanged extends WaterSupplyEditEvent {
  const VillageChanged(this.village);

  final VillageModel village;

  @override
  List<Object> get props => [village];
}

class MapTypeChanged extends WaterSupplyEditEvent {
  const MapTypeChanged(this.mapType);

  final MapTypeEnum mapType;

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

  final AreaEnum locationRick;

  @override
  List<Object> get props => [locationRick];
}

class BudgetTypeChanged extends WaterSupplyEditEvent {
  const BudgetTypeChanged(this.budgetType);

  final BudgetTypeEnum budgetType;

  @override
  List<Object> get props => [budgetType];
}

class ManagementTypeChanged extends WaterSupplyEditEvent {
  const ManagementTypeChanged(this.managementType);

  final ManagementTypeEnum managementType;

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

  final WaterSupplyTypeEnum waterSupplyType;

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

  final WellTypeEnum wellType;

  @override
  List<Object> get props => [wellType];
}

class WellDepthChanged extends WaterSupplyEditEvent {
  const WellDepthChanged(this.wellDepth);

  final String wellDepth;

  @override
  List<Object> get props => [wellDepth];
}

class UTMXChanged extends WaterSupplyEditEvent {
  const UTMXChanged(this.utmx);

  final String utmx;

  @override
  List<Object> get props => [utmx];
}

class UTMYChanged extends WaterSupplyEditEvent {
  const UTMYChanged(this.utmy);

  final String utmy;

  @override
  List<Object> get props => [utmy];
}

class LatDegreeChanged extends WaterSupplyEditEvent {
  const LatDegreeChanged(this.latDegree);

  final String latDegree;

  @override
  List<Object> get props => [latDegree];
}

class LatMinuteChanged extends WaterSupplyEditEvent {
  const LatMinuteChanged(this.latMinute);

  final String latMinute;

  @override
  List<Object> get props => [latMinute];
}

class LatSecondChanged extends WaterSupplyEditEvent {
  const LatSecondChanged(this.latSecond);

  final String latSecond;

  @override
  List<Object> get props => [latSecond];
}

class LongDegreeChanged extends WaterSupplyEditEvent {
  const LongDegreeChanged(this.longDegree);

  final String longDegree;

  @override
  List<Object> get props => [longDegree];
}

class LongMinuteChanged extends WaterSupplyEditEvent {
  const LongMinuteChanged(this.longMinute);

  final String longMinute;

  @override
  List<Object> get props => [longMinute];
}

class LongSecondChanged extends WaterSupplyEditEvent {
  const LongSecondChanged(this.longSecond);

  final String longSecond;

  @override
  List<Object> get props => [longSecond];
}

class WellScreenChanged extends WaterSupplyEditEvent {
  const WellScreenChanged(this.wellScreen);

  final String wellScreen;

  @override
  List<Object> get props => [wellScreen];
}

class WellThearChanged extends WaterSupplyEditEvent {
  const WellThearChanged(this.wellThear);

  final String wellThear;

  @override
  List<Object> get props => [wellThear];
}

class WaterQualityChanged extends WaterSupplyEditEvent {
  const WaterQualityChanged(this.waterQuality);

  final WaterQualityEnum waterQuality;

  @override
  List<Object> get props => [waterQuality];
}

class NiVoStaticChanged extends WaterSupplyEditEvent {
  const NiVoStaticChanged(this.niVoStatic);

  final String niVoStatic;

  @override
  List<Object> get props => [niVoStatic];
}

class NiVoDynamicChanged extends WaterSupplyEditEvent {
  const NiVoDynamicChanged(this.niVoDynamic);

  final String niVoDynamic;

  @override
  List<Object> get props => [niVoDynamic];
}

class CheckWaterQualityChanged extends WaterSupplyEditEvent {
  const CheckWaterQualityChanged(this.checkWaterQuality);

  final CheckWaterQualityEnum checkWaterQuality;

  @override
  List<Object> get props => [checkWaterQuality];
}

class WellStatusChanged extends WaterSupplyEditEvent {
  const WellStatusChanged(this.wellStatus);

  final WellStatusEnum wellStatus;

  @override
  List<Object> get props => [wellStatus];
}

class AirPoolChanged extends WaterSupplyEditEvent {
  const AirPoolChanged(this.airPool);

  final String airPool;

  @override
  List<Object> get props => [airPool];
}

class FilterTankChanged extends WaterSupplyEditEvent {
  const FilterTankChanged(this.filterTank);

  final FilterEnum filterTank;

  @override
  List<Object> get props => [filterTank];
}

class PipeLenghtChanged extends WaterSupplyEditEvent {
  const PipeLenghtChanged(this.pipeLenght);

  final String pipeLenght;

  @override
  List<Object> get props => [pipeLenght];
}

class PipeStatusChanged extends WaterSupplyEditEvent {
  const PipeStatusChanged(this.pipeStatus);

  final WellStatusEnum pipeStatus;

  @override
  List<Object> get props => [pipeStatus];
}

class CoverageChanged extends WaterSupplyEditEvent {
  const CoverageChanged(this.coverage);

  final String coverage;

  @override
  List<Object> get props => [coverage];
}

class ConnectorChanged extends WaterSupplyEditEvent {
  const ConnectorChanged(this.connector);

  final String connector;

  @override
  List<Object> get props => [connector];
}

class QualityWaterCheckChanged extends WaterSupplyEditEvent {
  const QualityWaterCheckChanged(this.quality);

  final WaterQualityEnum quality;

  @override
  List<Object> get props => [quality];
}

class PondLatChanged extends WaterSupplyEditEvent {
  const PondLatChanged(this.pondLat);

  final String pondLat;

  @override
  List<Object> get props => [pondLat];
}

class PondLongChanged extends WaterSupplyEditEvent {
  const PondLongChanged(this.pondLong);

  final String pondLong;

  @override
  List<Object> get props => [pondLong];
}

class PondFilterChanged extends WaterSupplyEditEvent {
  const PondFilterChanged(this.pondFilter);

  //final String pondFilter;
  final PondFilterEnum pondFilter;
  @override
  List<Object> get props => [pondFilter];
}

class PondTypeChanged extends WaterSupplyEditEvent {
  const PondTypeChanged(this.pondType);

  final PondTypeEnum pondType;

  @override
  List<Object> get props => [pondType];
}

class PondDepthChanged extends WaterSupplyEditEvent {
  const PondDepthChanged(this.pondDepth);

  final String pondDepth;

  @override
  List<Object> get props => [pondDepth];
}

class PondStatusChanged extends WaterSupplyEditEvent {
  const PondStatusChanged(this.pondStatus);

  //final String pondStatus;
  final PondStatusEnum pondStatus;

  @override
  List<Object> get props => [pondStatus];
}

class SeasonChanged extends WaterSupplyEditEvent {
  const SeasonChanged(this.season);

  final SeasonEnum season;

  @override
  List<Object> get props => [season];
}

class UsingTypeChanged extends WaterSupplyEditEvent {
  const UsingTypeChanged(this.usingType);

  final UsingTypeEnum usingType;

  @override
  List<Object> get props => [usingType];
}

class TankStatusChanged extends WaterSupplyEditEvent {
  const TankStatusChanged(this.tankStatus);

  final TankStatusEnum tankStatus;

  @override
  List<Object> get props => [tankStatus];
}

class CapacityTypeChanged extends WaterSupplyEditEvent {
  const CapacityTypeChanged(this.capacityType);

  final CapacityTypeEnum capacityType;

  @override
  List<Object> get props => [capacityType];
}

class SupplierChanged extends WaterSupplyEditEvent {
  const SupplierChanged(this.supplier);

  final FilterEnum supplier;

  @override
  List<Object> get props => [supplier];
}

class SupplierDateChanged extends WaterSupplyEditEvent {
  const SupplierDateChanged(this.supplierDate);

  final DateTime supplierDate;

  @override
  List<Object> get props => [supplierDate];
}

class DueDateChanged extends WaterSupplyEditEvent {
  const DueDateChanged(this.dueDate);

  final DateTime dueDate;

  @override
  List<Object> get props => [dueDate];
}

class FilterChanged extends WaterSupplyEditEvent {
  const FilterChanged(this.filter);

  final FilterEnum filter;

  @override
  List<Object> get props => [filter];
}

class AirStationChanged extends WaterSupplyEditEvent {
  const AirStationChanged(this.airStation);

  final WellStatusEnum airStation;

  @override
  List<Object> get props => [airStation];
}

class Submitted extends WaterSupplyEditEvent {
  const Submitted(this.waterSupplyStatus);

  final int waterSupplyStatus;

  @override
  List<Object> get props => [waterSupplyStatus];
}

/* Water Quality Paramter  */
class WaterQualityParameterChanged extends WaterSupplyEditEvent {
  const WaterQualityParameterChanged(this.value);
  final String value;

  @override
  List<Object> get props => [value];
}

//----- KIOSK
class AbilityProduceWaterChanged extends WaterSupplyEditEvent {
  const AbilityProduceWaterChanged(this.abilityProductWater);
  final String abilityProductWater;
  @override
  List<Object> get props => [abilityProductWater];
}

class KioskStatusChanged extends WaterSupplyEditEvent {
  const KioskStatusChanged(this.kioskStatus);
  final WellStatusEnum kioskStatus;
  @override
  List<Object> get props => [kioskStatus];
}

class KioskFilterChanged extends WaterSupplyEditEvent {
  const KioskFilterChanged(this.kioskFilter);

  final FilterEnum kioskFilter;

  @override
  List<Object> get props => [kioskFilter];
}

class GoogleMapPinChanged extends WaterSupplyEditEvent {
  const GoogleMapPinChanged(this.latLng);

  final LatLng latLng;

  @override
  List<Object> get props => [latLng];
}
