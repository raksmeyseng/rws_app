part of 'filter_bloc.dart';

class FilterState extends Equatable {
  const FilterState._(
      {this.status = BaseStatusEnum.initial,
      this.waterSupplyTypeId = 1,
      this.waterSupplyCodeInput = const WaterSupplyInput.pure(),
      this.provinceInput = const WaterSupplyInput.pure(),
      this.districtInput = const WaterSupplyInput.pure(),
      this.communeInput = const WaterSupplyInput.pure(),
      this.villageInput = const WaterSupplyInput.pure(),
      this.provinces = const [],
      this.districts = const [],
      this.communes = const [],
      this.villages = const [],
      this.provinceId = '',
      this.disctrictId = '',
      this.communeId = '',
      this.villageId = ''});

  final BaseStatusEnum status;
  final int waterSupplyTypeId;
  final WaterSupplyInput waterSupplyCodeInput;
  final WaterSupplyInput provinceInput;
  final WaterSupplyInput districtInput;
  final WaterSupplyInput communeInput;
  final WaterSupplyInput villageInput;
  final List<ProvinceModel> provinces;
  final List<DistrictModel> districts;
  final List<CommuneModel> communes;
  final List<VillageModel> villages;
  final String provinceId;
  final String disctrictId;
  final String communeId;
  final String villageId;

  const FilterState.initial({required int waterSupplyTypeId})
      : this._(waterSupplyTypeId: waterSupplyTypeId);

  FilterState copyWith(
      {BaseStatusEnum? status,
      int? waterSupplyTypeId,
      WaterSupplyInput? waterSupplyCodeInput,
      WaterSupplyInput? provinceInput,
      WaterSupplyInput? districtInput,
      WaterSupplyInput? communeInput,
      WaterSupplyInput? villageInput,
      List<ProvinceModel>? provinces,
      List<DistrictModel>? districts,
      List<CommuneModel>? communes,
      List<VillageModel>? villages,
      String? provinceId,
      String? disctrictId,
      String? communeId,
      String? villageId}) {
    return FilterState._(
        status: status ?? this.status,
        waterSupplyTypeId: waterSupplyTypeId ?? this.waterSupplyTypeId,
        waterSupplyCodeInput: waterSupplyCodeInput ?? this.waterSupplyCodeInput,
        provinceInput: provinceInput ?? this.provinceInput,
        districtInput: districtInput ?? this.districtInput,
        communeInput: communeInput ?? this.communeInput,
        villageInput: villageInput ?? this.villageInput,
        provinces: provinces ?? this.provinces,
        districts: districts ?? this.districts,
        communes: communes ?? this.communes,
        villages: villages ?? this.villages,
        provinceId: provinceId ?? this.provinceId,
        disctrictId: disctrictId ?? this.disctrictId,
        communeId: communeId ?? this.communeId,
        villageId: villageId ?? this.villageId);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        waterSupplyTypeId,
        waterSupplyCodeInput,
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        provinces,
        districts,
        communes,
        villages,
        provinceId,
        disctrictId,
        communeId,
        villageId
      ];
}
