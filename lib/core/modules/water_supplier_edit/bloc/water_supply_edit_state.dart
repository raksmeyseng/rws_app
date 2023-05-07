part of 'water_supply_edit_bloc.dart';

class WaterSupplyEditState extends Equatable {
  const WaterSupplyEditState._({
    this.status = BaseStatusEnum.initial,
    this.waterSupply,
    this.waterSupplyId = 0,
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
    this.receiverFamilyMinorityInput = const WaterSupplyInput.pure(),
    this.receiverFamilyVictimInput = const WaterSupplyInput.pure(),
  });

  final BaseStatusEnum status;
  final WaterSupplyModel? waterSupply;
  final int waterSupplyId;
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
  final WaterSupplyInput receiverFamilyMinorityInput;
  final WaterSupplyInput receiverFamilyVictimInput;

  const WaterSupplyEditState.initial({required int waterSupplyId})
      : this._(waterSupplyId: waterSupplyId);

  WaterSupplyEditState copyWith({
    BaseStatusEnum? status,
    WaterSupplyModel? waterSupply,
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
    WaterSupplyInput? receiverFamilyMinorityInput,
    WaterSupplyInput? receiverFamilyVictimInput,
  }) {
    return WaterSupplyEditState._(
      status: status ?? this.status,
      waterSupply: waterSupply ?? this.waterSupply,
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
      receiverFamilyMinorityInput:
          receiverFamilyMinorityInput ?? this.receiverFamilyMinorityInput,
      receiverFamilyVictimInput:
          receiverFamilyVictimInput ?? this.receiverFamilyVictimInput,
    );
  }

  @override
  List<Object?> get props => [
        status,
        waterSupply,
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
        receiverFamilyMinorityInput,
        receiverFamilyVictimInput,
      ];
}
