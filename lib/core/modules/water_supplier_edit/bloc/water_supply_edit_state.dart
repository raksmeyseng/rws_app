part of 'water_supply_edit_bloc.dart';

class WaterSupplyEditState extends Equatable {
  const WaterSupplyEditState._({
    this.status = BaseStatusEnum.initial,
    this.formzStatus = FormzStatus.pure,
    this.waterSupply,
    this.waterSupplyTypeId = 0,
    this.id = 0,
    this.provinceInput = const WaterSupplyInput.pure(),
    this.districtInput = const WaterSupplyInput.pure(),
    this.communeInput = const WaterSupplyInput.pure(),
    this.villageInput = const WaterSupplyInput.pure(),
    this.mapTypeInput = const WaterSupplyInput.pure(),
    this.familyTotalInput = const WaterSupplyInput.pure(),
    this.lateitudeInput = const WaterSupplyInput.pure(),
    this.longtitudeInput = const WaterSupplyInput.pure(),
    this.locationRickInput = const WaterSupplyInput.pure(),
    this.budgetTypeInput = const WaterSupplyInput.pure(),
    this.managementTypeInput = const WaterSupplyInput.pure(),
    this.managementNameInput = const WaterSupplyInput.pure(),
    this.receiverTotalInput = const WaterSupplyInput.pure(),
    this.receiverTotalAsFemaleInput = const WaterSupplyInput.pure(),
    this.receiverFamilyTotalInput = const WaterSupplyInput.pure(),
    this.receiverFamilyPoor1Input = const WaterSupplyInput.pure(),
    this.receiverFamilyPoor2Input = const WaterSupplyInput.pure(),
    this.provinces = const [],
    this.districts = const [],
    this.communes = const [],
    this.villages = const [],
    this.docInput = const DOCInput.pure(),
    this.companyNameInput = const WaterSupplyInput.pure(),
    this.constructionCodeInput = const WaterSupplyInput.pure(),
    this.receiverFamilyIndigenousInput = const WaterSupplyInput.pure(),
    this.receiverFamilyVulnearableInput = const WaterSupplyInput.pure(),
    this.waterSupplyTypeInput = const WaterSupplyInput.pure(),
    this.containerInput = const WaterSupplyInput.pure(),
    this.capacityInput = const WaterSupplyInput.pure(),
    this.wellTypeInput = const WaterSupplyInput.pure(),
    this.wellDepthInput = const WaterSupplyInput.pure(),
    this.utmXInput = const WaterSupplyInput.pure(),
    this.utmYInput = const WaterSupplyInput.pure(),
    this.latDegreeInput = const WaterSupplyInput.pure(),
    this.latMinuteInput = const WaterSupplyInput.pure(),
    this.latSecondInput = const WaterSupplyInput.pure(),
    this.longDegreeInput = const WaterSupplyInput.pure(),
    this.longMinuteInput = const WaterSupplyInput.pure(),
    this.longSecondInput = const WaterSupplyInput.pure(),
    this.wellScreenInput = const WaterSupplyInput.pure(),
    this.wellThearInput = const WaterSupplyInput.pure(),
    this.waterQualityInput = const WaterSupplyInput.pure(),
    this.niVoStaticInput = const WaterSupplyInput.pure(),
    this.niVoDynamicInput = const WaterSupplyInput.pure(),
    this.checkWaterQualityInput = const WaterSupplyInput.pure(),
    this.wellStatusInput = const WaterSupplyInput.pure(),
    this.airPoolInput = const WaterSupplyInput.pure(),
    this.filterTankInput = const WaterSupplyInput.pure(),
    this.connectorInput = const WaterSupplyInput.pure(),
    this.coverageInput = const WaterSupplyInput.pure(),
    this.pipeStatusInput = const WaterSupplyInput.pure(),
    this.pipeLenghtInput = const WaterSupplyInput.pure(),
    this.qualityWaterCheckInput = const WaterSupplyInput.pure(),
    this.pondLatInput = const WaterSupplyInput.pure(),
    this.pondLongInput = const WaterSupplyInput.pure(),
    this.pondFilterInput = const WaterSupplyInput.pure(),
    this.pondDepthInput = const WaterSupplyInput.pure(),
    this.pondTypeInput = const WaterSupplyInput.pure(),
    this.seasonInput = const WaterSupplyInput.pure(),
    this.pondStatusInput = const WaterSupplyInput.pure(),
    this.usingTypeInput = const WaterSupplyInput.pure(),
    this.capacityTypeInput = const WaterSupplyInput.pure(),
    this.tankStatusInput = const WaterSupplyInput.pure(),
    this.supplierInput = const WaterSupplyInput.pure(),
    this.supplierDateInput = const DOCInput.pure(),
    this.dueDateInput = const DOCInput.pure(),
    this.filterInput = const WaterSupplyInput.pure(),
    this.airStationInput = const WaterSupplyInput.pure(),
  });

  final BaseStatusEnum status;
  final FormzStatus formzStatus;
  final WaterSupplyModel? waterSupply;
  final int waterSupplyTypeId;
  final int id;
  final WaterSupplyInput provinceInput;
  final WaterSupplyInput districtInput;
  final WaterSupplyInput communeInput;
  final WaterSupplyInput villageInput;
  final WaterSupplyInput mapTypeInput;
  final WaterSupplyInput familyTotalInput;
  final WaterSupplyInput lateitudeInput;
  final WaterSupplyInput longtitudeInput;
  final WaterSupplyInput locationRickInput;
  final WaterSupplyInput budgetTypeInput;
  final WaterSupplyInput managementTypeInput;
  final WaterSupplyInput managementNameInput;
  final WaterSupplyInput receiverTotalInput;
  final WaterSupplyInput receiverTotalAsFemaleInput;
  final WaterSupplyInput receiverFamilyTotalInput;
  final WaterSupplyInput receiverFamilyPoor1Input;
  final WaterSupplyInput receiverFamilyPoor2Input;
  final List<ProvinceModel> provinces;
  final List<DistrictModel> districts;
  final List<CommuneModel> communes;
  final List<VillageModel> villages;
  final DOCInput docInput;
  final WaterSupplyInput companyNameInput;
  final WaterSupplyInput constructionCodeInput;
  final WaterSupplyInput receiverFamilyIndigenousInput;
  final WaterSupplyInput receiverFamilyVulnearableInput;
  final WaterSupplyInput waterSupplyTypeInput;
  final WaterSupplyInput containerInput;
  final WaterSupplyInput capacityInput;
  final WaterSupplyInput wellTypeInput;
  final WaterSupplyInput wellDepthInput;
  final WaterSupplyInput utmXInput;
  final WaterSupplyInput utmYInput;
  final WaterSupplyInput latDegreeInput;
  final WaterSupplyInput latMinuteInput;
  final WaterSupplyInput latSecondInput;
  final WaterSupplyInput longDegreeInput;
  final WaterSupplyInput longMinuteInput;
  final WaterSupplyInput longSecondInput;
  final WaterSupplyInput wellScreenInput;
  final WaterSupplyInput wellThearInput;
  final WaterSupplyInput waterQualityInput;
  final WaterSupplyInput niVoStaticInput;
  final WaterSupplyInput niVoDynamicInput;
  final WaterSupplyInput checkWaterQualityInput;
  final WaterSupplyInput wellStatusInput;
  final WaterSupplyInput airPoolInput;
  final WaterSupplyInput filterTankInput;
  final WaterSupplyInput connectorInput;
  final WaterSupplyInput pipeLenghtInput;
  final WaterSupplyInput pipeStatusInput;
  final WaterSupplyInput coverageInput;
  final WaterSupplyInput qualityWaterCheckInput;
  final WaterSupplyInput pondLatInput;
  final WaterSupplyInput pondLongInput;
  final WaterSupplyInput pondDepthInput;
  final WaterSupplyInput pondFilterInput;
  final WaterSupplyInput pondTypeInput;
  final WaterSupplyInput seasonInput;
  final WaterSupplyInput pondStatusInput;
  final WaterSupplyInput usingTypeInput;
  final WaterSupplyInput capacityTypeInput;
  final WaterSupplyInput tankStatusInput;
  final WaterSupplyInput supplierInput;
  final DOCInput supplierDateInput;
  final DOCInput dueDateInput;
  final WaterSupplyInput filterInput;
  final WaterSupplyInput airStationInput;

  const WaterSupplyEditState.initial({
    required int waterSupplyTypeId,
    required int id,
  }) : this._(waterSupplyTypeId: waterSupplyTypeId, id: id);

  WaterSupplyEditState copyWith({
    BaseStatusEnum? status,
    FormzStatus? formzStatus,
    WaterSupplyModel? waterSupply,
    int? waterSupplyTypeId,
    int? id,
    WaterSupplyInput? provinceInput,
    WaterSupplyInput? districtInput,
    WaterSupplyInput? communeInput,
    WaterSupplyInput? villageInput,
    WaterSupplyInput? mapTypeInput,
    WaterSupplyInput? familyTotalInput,
    WaterSupplyInput? lateitudeInput,
    WaterSupplyInput? longtitudeInput,
    WaterSupplyInput? locationRickInput,
    WaterSupplyInput? budgetTypeInput,
    WaterSupplyInput? managementTypeInput,
    WaterSupplyInput? managementNameInput,
    WaterSupplyInput? receiverTotalInput,
    WaterSupplyInput? receiverTotalAsFemaleInput,
    WaterSupplyInput? receiverFamilyTotalInput,
    WaterSupplyInput? receiverFamilyPoor1Input,
    WaterSupplyInput? receiverFamilyPoor2Input,
    List<ProvinceModel>? provinces,
    List<DistrictModel>? districts,
    List<CommuneModel>? communes,
    List<VillageModel>? villages,
    DOCInput? docInput,
    WaterSupplyInput? companyNameInput,
    WaterSupplyInput? constructionCodeInput,
    WaterSupplyInput? receiverFamilyIndigenousInput,
    WaterSupplyInput? receiverFamilyVulnearableInput,
    WaterSupplyInput? waterSupplyTypeInput,
    WaterSupplyInput? containerInput,
    WaterSupplyInput? capacityInput,
    WaterSupplyInput? wellTypeInput,
    WaterSupplyInput? wellDepthInput,
    WaterSupplyInput? utmXInput,
    WaterSupplyInput? utmYInput,
    WaterSupplyInput? latDegreeInput,
    WaterSupplyInput? latMinuteInput,
    WaterSupplyInput? latSecondInput,
    WaterSupplyInput? longDegreeInput,
    WaterSupplyInput? longMinuteInput,
    WaterSupplyInput? longSecondInput,
    WaterSupplyInput? wellScreenInput,
    WaterSupplyInput? wellThearInput,
    WaterSupplyInput? waterQualityInput,
    WaterSupplyInput? niVoStaticInput,
    WaterSupplyInput? niVoDynamicInput,
    WaterSupplyInput? checkWaterQualityInput,
    WaterSupplyInput? wellStatusInput,
    WaterSupplyInput? airPoolInput,
    WaterSupplyInput? filterTankInput,
    WaterSupplyInput? connectorInput,
    WaterSupplyInput? pipeLenghtInput,
    WaterSupplyInput? pipeStatusInput,
    WaterSupplyInput? coverageInput,
    WaterSupplyInput? qualityWaterCheckInput,
    WaterSupplyInput? pondLatInput,
    WaterSupplyInput? pondLongInput,
    WaterSupplyInput? pondDepthInput,
    WaterSupplyInput? pondFilterInput,
    WaterSupplyInput? pondTypeInput,
    WaterSupplyInput? seasonInput,
    WaterSupplyInput? pondStatusInput,
    WaterSupplyInput? usingTypeInput,
    WaterSupplyInput? capacityTypeInput,
    WaterSupplyInput? tankStatusInput,
    WaterSupplyInput? supplierInput,
    DOCInput? supplierDateInput,
    DOCInput? dueDateInput,
    WaterSupplyInput? filterInput,
    WaterSupplyInput? airStationInput,
  }) {
    return WaterSupplyEditState._(
      status: status ?? this.status,
      formzStatus: formzStatus ?? this.formzStatus,
      waterSupply: waterSupply ?? this.waterSupply,
      waterSupplyTypeId: waterSupplyTypeId ?? this.waterSupplyTypeId,
      id: id ?? this.id,
      provinceInput: provinceInput ?? this.provinceInput,
      districtInput: districtInput ?? this.districtInput,
      communeInput: communeInput ?? this.communeInput,
      villageInput: villageInput ?? this.villageInput,
      mapTypeInput: mapTypeInput ?? this.mapTypeInput,
      familyTotalInput: familyTotalInput ?? this.familyTotalInput,
      lateitudeInput: lateitudeInput ?? this.lateitudeInput,
      longtitudeInput: longtitudeInput ?? this.longtitudeInput,
      locationRickInput: locationRickInput ?? this.locationRickInput,
      budgetTypeInput: budgetTypeInput ?? this.budgetTypeInput,
      managementTypeInput: managementTypeInput ?? this.managementTypeInput,
      managementNameInput: managementNameInput ?? this.managementNameInput,
      receiverTotalInput: receiverTotalInput ?? this.receiverTotalInput,
      receiverTotalAsFemaleInput:
          receiverTotalAsFemaleInput ?? this.receiverTotalAsFemaleInput,
      receiverFamilyTotalInput:
          receiverFamilyTotalInput ?? this.receiverFamilyTotalInput,
      receiverFamilyPoor1Input:
          receiverFamilyPoor1Input ?? this.receiverFamilyPoor1Input,
      receiverFamilyPoor2Input:
          receiverFamilyPoor2Input ?? this.receiverFamilyPoor2Input,
      provinces: provinces ?? this.provinces,
      districts: districts ?? this.districts,
      communes: communes ?? this.communes,
      villages: villages ?? this.villages,
      docInput: docInput ?? this.docInput,
      companyNameInput: companyNameInput ?? this.companyNameInput,
      constructionCodeInput:
          constructionCodeInput ?? this.constructionCodeInput,
      receiverFamilyIndigenousInput:
          receiverFamilyIndigenousInput ?? this.receiverFamilyIndigenousInput,
      receiverFamilyVulnearableInput:
          receiverFamilyVulnearableInput ?? this.receiverFamilyVulnearableInput,
      waterSupplyTypeInput: waterSupplyTypeInput ?? this.waterSupplyTypeInput,
      containerInput: containerInput ?? this.containerInput,
      capacityInput: capacityInput ?? this.capacityInput,
      wellTypeInput: wellTypeInput ?? this.wellTypeInput,
      wellDepthInput: wellDepthInput ?? this.wellDepthInput,
      utmXInput: utmXInput ?? this.utmXInput,
      utmYInput: utmYInput ?? this.utmYInput,
      latDegreeInput: latDegreeInput ?? this.latDegreeInput,
      latMinuteInput: latMinuteInput ?? this.latMinuteInput,
      latSecondInput: latSecondInput ?? this.latSecondInput,
      longDegreeInput: longDegreeInput ?? this.longDegreeInput,
      longMinuteInput: longMinuteInput ?? this.longMinuteInput,
      longSecondInput: longSecondInput ?? this.longSecondInput,
      wellScreenInput: wellScreenInput ?? this.wellScreenInput,
      wellThearInput: wellThearInput ?? this.wellThearInput,
      waterQualityInput: waterQualityInput ?? this.waterQualityInput,
      niVoStaticInput: niVoStaticInput ?? this.niVoStaticInput,
      niVoDynamicInput: niVoDynamicInput ?? this.niVoDynamicInput,
      checkWaterQualityInput:
          checkWaterQualityInput ?? this.checkWaterQualityInput,
      wellStatusInput: wellStatusInput ?? this.wellStatusInput,
      airPoolInput: airPoolInput ?? this.airPoolInput,
      filterTankInput: filterTankInput ?? this.filterTankInput,
      connectorInput: connectorInput ?? this.connectorInput,
      pipeLenghtInput: pipeLenghtInput ?? this.pipeLenghtInput,
      pipeStatusInput: pipeStatusInput ?? this.pipeStatusInput,
      coverageInput: coverageInput ?? this.coverageInput,
      qualityWaterCheckInput:
          qualityWaterCheckInput ?? this.qualityWaterCheckInput,
      pondLatInput: pondLatInput ?? this.pondLatInput,
      pondLongInput: pondLongInput ?? this.pondLongInput,
      pondDepthInput: pondDepthInput ?? this.pondDepthInput,
      pondFilterInput: pondFilterInput ?? this.pondFilterInput,
      pondTypeInput: pondTypeInput ?? this.pondTypeInput,
      seasonInput: seasonInput ?? this.seasonInput,
      pondStatusInput: pondStatusInput ?? this.pondStatusInput,
      usingTypeInput: usingTypeInput ?? this.usingTypeInput,
      capacityTypeInput: capacityTypeInput ?? this.capacityTypeInput,
      tankStatusInput: tankStatusInput ?? this.tankStatusInput,
      supplierInput: supplierInput ?? this.supplierInput,
      supplierDateInput: supplierDateInput ?? this.supplierDateInput,
      dueDateInput: dueDateInput ?? this.dueDateInput,
      filterInput: filterInput ?? this.filterInput,
      airStationInput: airStationInput ?? this.airStationInput,
    );
  }

  @override
  List<Object?> get props => [
        status,
        formzStatus,
        waterSupply,
        waterSupplyTypeId,
        id,
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        mapTypeInput,
        familyTotalInput,
        lateitudeInput,
        longtitudeInput,
        locationRickInput,
        budgetTypeInput,
        managementTypeInput,
        managementNameInput,
        receiverTotalInput,
        receiverTotalAsFemaleInput,
        receiverFamilyTotalInput,
        receiverFamilyPoor1Input,
        receiverFamilyPoor2Input,
        provinces,
        districts,
        communes,
        villages,
        docInput,
        companyNameInput,
        constructionCodeInput,
        receiverFamilyIndigenousInput,
        receiverFamilyVulnearableInput,
        waterSupplyTypeInput,
        containerInput,
        capacityInput,
        wellTypeInput,
        wellDepthInput,
        utmXInput,
        utmYInput,
        latDegreeInput,
        latMinuteInput,
        latSecondInput,
        longDegreeInput,
        longMinuteInput,
        longSecondInput,
        wellScreenInput,
        wellThearInput,
        waterQualityInput,
        niVoStaticInput,
        niVoDynamicInput,
        checkWaterQualityInput,
        wellStatusInput,
        airPoolInput,
        filterTankInput,
        connectorInput,
        pipeLenghtInput,
        pipeStatusInput,
        coverageInput,
        qualityWaterCheckInput,
        pondLatInput,
        pondLongInput,
        pondDepthInput,
        pondFilterInput,
        pondTypeInput,
        seasonInput,
        pondStatusInput,
        usingTypeInput,
        capacityTypeInput,
        tankStatusInput,
        supplierInput,
        supplierDateInput,
        dueDateInput,
        filterInput,
        airStationInput,
      ];
}
