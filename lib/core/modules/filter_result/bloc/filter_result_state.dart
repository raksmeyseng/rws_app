part of 'filter_result_bloc.dart';

class FilterResultState extends Equatable {
  const FilterResultState._(
      {this.status = BaseStatusEnum.initial,
      this.waterSupplyTypeId = 1,
      this.waterSupplyCode = '',
      this.waterSupply = const [],
      this.provinceId = '',
      this.districtId = '',
      this.communeId = '',
      this.villageId = ''});
  final BaseStatusEnum status;
  final int waterSupplyTypeId;
  final String waterSupplyCode;
  final String provinceId;
  final String districtId;
  final String communeId;
  final String villageId;
  final List<WaterSupplyListByTypeModel> waterSupply;

  const FilterResultState.initial(
      {required int waterSupplyTypeId,
      required String waterSupplyCode,
      required String provinceId,
      required String districtId,
      required String communeId,
      required String villageId})
      : this._(
            waterSupplyTypeId: waterSupplyTypeId,
            waterSupplyCode: waterSupplyCode,
            provinceId: provinceId,
            districtId: districtId,
            communeId: communeId,
            villageId: villageId);

  FilterResultState copyWith(
      {BaseStatusEnum? status,
      int? waterSupplyTypeId,
      List<WaterSupplyListByTypeModel>? waterSupply,
      String? waterSupplyCode,
      String? provinceId,
      String? districtId,
      String? communeId,
      String? villageId}) {
    return FilterResultState._(
        status: status ?? this.status,
        waterSupplyTypeId: waterSupplyTypeId ?? this.waterSupplyTypeId,
        waterSupply: waterSupply ?? this.waterSupply,
        waterSupplyCode: waterSupplyCode ?? this.waterSupplyCode,
        provinceId: provinceId ?? this.provinceId,
        districtId: districtId ?? this.districtId,
        communeId: communeId ?? this.communeId,
        villageId: villageId ?? this.villageId);
  }

  @override
  List<Object?> get props => [
        status,
        waterSupplyTypeId,
        waterSupplyCode,
        waterSupply,
        provinceId,
        districtId,
        communeId,
        villageId
      ];
}
