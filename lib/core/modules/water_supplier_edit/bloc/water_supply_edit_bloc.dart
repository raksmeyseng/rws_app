//import 'dart:js';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:latlong_to_osgrid/latlong_to_osgrid.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/budget_type.dart';
import 'package:rws_app/core/enum/check_water_quality_enum.dart';
import 'package:rws_app/core/enum/management_type.dart';
import 'package:rws_app/core/enum/water_supply_type_enum.dart';
import 'package:rws_app/core/enum/well_status_enum.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/budget_type_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/doc_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/input/map_type_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/management_type_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_air_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_pipe_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_pond_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_rain_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_smallpipe_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_water_quality_parameter_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_water_supply_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_well.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/qrcode_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/repositories/water_supply_edit_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/utils/event/event_type.dart';
import 'package:rws_app/utils/helpers/date_helper.dart';
import 'package:rws_app/utils/helpers/loading_helper.dart';

import '../../../enum/area_enum.dart';
import '../../../enum/capacity_type_enum.dart';
import '../../../enum/filter_enum.dart';
import '../../../enum/map_type_enum.dart';
import '../../../enum/pond_filter_enum.dart';
import '../../../enum/pond_status_enum.dart';
import '../../../enum/pond_type_enum.dart';
import '../../../enum/season_enum.dart';
import '../../../enum/tank_status_enum.dart';
import '../../../enum/using_type_enum.dart';
import '../../../enum/water_quality_enum.dart';
import '../../../enum/well_type_enum.dart';
import '../model/input/capacity_input.dart';
import '../model/input/check_water_quality_input.dart';
import '../model/input/pond_status_input.dart';
import '../model/input/pondfilter_input.dart';
import '../model/input/pondtype_input.dart';
import '../model/input/poolfilter_input.dart';
import '../model/input/season_haswater_input.dart';
import '../model/input/status_input.dart';
import '../model/input/tank_status_input.dart';
import '../model/input/using_type_input.dart';
import '../model/input/water_supply_type_input.dart';
import '../model/location_risk_input.dart';
import '../model/payload_kiosk_model.dart';
import '../model/water_quality_input.dart';
import '../model/well_type_input.dart';

part 'water_supply_edit_event.dart';
part 'water_supply_edit_state.dart';

class WaterSupplyEditBloc
    extends Bloc<WaterSupplyEditEvent, WaterSupplyEditState> {
  WaterSupplyEditBloc({
    required this.repository,
    required int waterSupplyId,
    required int id,
  }) : super(WaterSupplyEditState.initial(
            waterSupplyTypeId: waterSupplyId, id: id)) {
    on<WaterSupplyEditEvent>(_onWaterSupplyEvent);
  }

  final WaterSupplyEditRepository repository;
  final FocusNode provinceFocus = FocusNode();
  final provinceController = TextEditingController();
  final FocusNode districtFocus = FocusNode();
  final districtController = TextEditingController();
  final FocusNode communeFocus = FocusNode();
  final communeController = TextEditingController();
  final FocusNode villageFocus = FocusNode();
  final villageController = TextEditingController();
  final FocusNode mapTypeFocus = FocusNode();
  final mapTypeController = TextEditingController();
  final FocusNode latetitudeFocus = FocusNode();
  final latetitudeController = TextEditingController();
  final FocusNode longtitudeFocus = FocusNode();
  final longtitudeController = TextEditingController();
  final FocusNode familyTotalFocus = FocusNode();
  final familyTotalController = TextEditingController();
  final FocusNode locationRickFocus = FocusNode();
  final locationRickController = TextEditingController();
  final FocusNode budgetTypeFocus = FocusNode();
  final budgetTypeController = TextEditingController();
  final FocusNode managementTypeFocus = FocusNode();
  final managementTypeController = TextEditingController();
  final FocusNode managementNameFocus = FocusNode();
  final managementNameController = TextEditingController();
  final FocusNode receiverTotalFocus = FocusNode();
  final receiverTotalController = TextEditingController();
  final FocusNode receiverTotalAsFemaleFocus = FocusNode();
  final receiverTotalAsFemaleController = TextEditingController();
  final FocusNode receiverFamilyTotalFocus = FocusNode();
  final receiverFamilyTotalController = TextEditingController();
  final FocusNode receiverFamilyPoor1Focus = FocusNode();
  final receiverFamilyPoor1Controller = TextEditingController();
  final FocusNode receiverFamilyPoor2Focus = FocusNode();
  final receiverFamilyPoor2Controller = TextEditingController();
  final docController = TextEditingController();
  final FocusNode companyNameFocus = FocusNode();
  final companyNameController = TextEditingController();
  final FocusNode constructionCodeFocus = FocusNode();
  final constructionCodeController = TextEditingController();
  final FocusNode receiverFamilyMinorityFocus = FocusNode();
  final receiverFamilyMinorityController = TextEditingController();
  final FocusNode receiverFamilyVictimFocus = FocusNode();
  final receiverFamilyVictimController = TextEditingController();
  final FocusNode waterSupplyTypeFocus = FocusNode();
  final waterSupplyTypeController = TextEditingController();
  final FocusNode containerFocus = FocusNode();
  final containerController = TextEditingController();
  final FocusNode capacityFocus = FocusNode();
  final capacityController = TextEditingController();
  final FocusNode wellTypeFocus = FocusNode();
  final wellTypeController = TextEditingController();
  final FocusNode wellDepthFocus = FocusNode();
  final wellDepthController = TextEditingController();
  final FocusNode utmXFocus = FocusNode();
  final utmXController = TextEditingController();
  final FocusNode utmYFocus = FocusNode();
  final utmYController = TextEditingController();
  final FocusNode latDegreeFocus = FocusNode();
  final latDegreeController = TextEditingController();
  final FocusNode latMinuteFocus = FocusNode();
  final latMinuteController = TextEditingController();
  final FocusNode latSecondFocus = FocusNode();
  final latSecondController = TextEditingController();
  final FocusNode longDegreeFocus = FocusNode();
  final longDegreeController = TextEditingController();
  final FocusNode longMinuteFocus = FocusNode();
  final longMinuteController = TextEditingController();
  final FocusNode longSecondFocus = FocusNode();
  final longSecondController = TextEditingController();
  final FocusNode wellScreenFocus = FocusNode();
  final wellScreenController = TextEditingController();
  final FocusNode wellThearFocus = FocusNode();
  final wellThearController = TextEditingController();
  final FocusNode waterQualityFocus = FocusNode();
  final waterQualityController = TextEditingController();
  final FocusNode checkWaterQualityFocus = FocusNode();
  final checkWaterQualityController = TextEditingController();
  final FocusNode niVoStaticFocus = FocusNode();
  final niVoStaticController = TextEditingController();
  final FocusNode niVoDynamicFocus = FocusNode();
  final niVoDynamicController = TextEditingController();
  final FocusNode wellStatusFocus = FocusNode();
  final wellStatusController = TextEditingController();
  final FocusNode ariPoolFocus = FocusNode();
  final ariPoolController = TextEditingController();
  final FocusNode filterTankFocus = FocusNode();
  final filterTankController = TextEditingController();
  final FocusNode pipeLenghtFocus = FocusNode();
  final pipeLenghtController = TextEditingController();
  final FocusNode pipeStatusFocus = FocusNode();
  final pipeStatusController = TextEditingController();
  final FocusNode coverageFocus = FocusNode();
  final coverageController = TextEditingController();
  final FocusNode connectorFocus = FocusNode();
  final connectorController = TextEditingController();
  final FocusNode qualityWaterCheckFocus = FocusNode();
  final qualityWaterCheckController = TextEditingController();
  final FocusNode pondLatFocus = FocusNode();
  final pondLatController = TextEditingController();
  final FocusNode pondLongFocus = FocusNode();
  final pondLongController = TextEditingController();
  final FocusNode pondDepthFocus = FocusNode();
  final pondDepthController = TextEditingController();
  final FocusNode pondTypeFocus = FocusNode();
  final pondTypeController = TextEditingController();
  final FocusNode pondStatusFocus = FocusNode();
  final pondStatusController = TextEditingController();
  final FocusNode seasonFocus = FocusNode();
  final seasonController = TextEditingController();
  final FocusNode pondFilterFocus = FocusNode();
  final pondFilterController = TextEditingController();
  final FocusNode usingTypeFocus = FocusNode();
  final usingTypeController = TextEditingController();
  final FocusNode tankStatusFocus = FocusNode();
  final tankStatusController = TextEditingController();
  final FocusNode capacityTypeFocus = FocusNode();
  final capacityTypeController = TextEditingController();
  final FocusNode supplierFocus = FocusNode();
  final supplierController = TextEditingController();
  final supplierDateController = TextEditingController();
  final dueDateController = TextEditingController();
  final FocusNode filterFocus = FocusNode();
  final filterController = TextEditingController();
  final FocusNode airStationFocus = FocusNode();
  final airStationController = TextEditingController();
  final FocusNode abilityProductWaterFocus = FocusNode();
  final abilityProductWaterController = TextEditingController();
  final FocusNode kioskStatusFocus = FocusNode();
  final kioskStatusController = TextEditingController();
  final FocusNode kioskFilterFocus = FocusNode();
  final kioskFilterController = TextEditingController();

  /* Water Quality Parameter */
  final FocusNode parameter1 = FocusNode();
  final parameter1Controller = TextEditingController();

  Future<void> _onWaterSupplyEvent(
    WaterSupplyEditEvent event,
    Emitter<WaterSupplyEditState> emit,
  ) async {
    if (event is WaterSupplyStarted) {
      return _onWaterSupplyStarted(event, emit);
    }
    if (event is ProvinceChanged) {
      return _onProvinceChanged(event, emit);
    }
    if (event is DistrictChanged) {
      return _onDistrictChanged(event, emit);
    }
    if (event is CommnueChanged) {
      return _onCommuneChanged(event, emit);
    }
    if (event is VillageChanged) {
      return _onVillageChanged(event, emit);
    }
    if (event is MapTypeChanged) {
      return _onMapTypeChanged(event, emit);
    }
    if (event is LatetitudeChanged) {
      return _onLatetitudeChanged(event, emit);
    }
    if (event is LongtitudeChanged) {
      return _onLongtitudeChanged(event, emit);
    }
    if (event is FamilyTotalChanged) {
      return _onFamilyTotalChanged(event, emit);
    }
    if (event is LocationRickChanged) {
      return _onLocationRickChanged(event, emit);
    }
    if (event is BudgetTypeChanged) {
      return _onBudgetTypeChanged(event, emit);
    }
    if (event is ManagementTypeChanged) {
      return _onManagementTypeChanged(event, emit);
    }
    if (event is ManagementNameChanged) {
      return _onManagementNameChanged(event, emit);
    }
    if (event is ReceiverTotalChanged) {
      return _onReceiverTotalChanged(event, emit);
    }
    if (event is ReceiverTotalAsFemaleChanged) {
      return _onReceiverTotalAsFemaleChanged(event, emit);
    }
    if (event is ReceiverFamilyTotalChanged) {
      return _onReceiverFamilyTotalChanged(event, emit);
    }
    if (event is ReceiverFamilyPoor1Changed) {
      return _onReceiverFamilyPoor1Changed(event, emit);
    }
    if (event is ReceiverFamilyPoor2Changed) {
      return _onReceiverFamilyPoor2Changed(event, emit);
    }
    if (event is DOCChanged) {
      return _onDOCChanged(event, emit);
    }
    if (event is CompanyNameChanged) {
      return _onCompanyNameChanged(event, emit);
    }
    if (event is ConstructionCodeChanged) {
      return _onConstructionCodeChanged(event, emit);
    }
    if (event is ReceiverFamilyMinorityChanged) {
      return _onReceiverFamilyMinorityChanged(event, emit);
    }
    if (event is ReceiverFamilyVictimChanged) {
      return _onReceiverFamilyVictimChanged(event, emit);
    }
    if (event is WaterSupplyTypeChanged) {
      return _onWaterSupplyTypeChanged(event, emit);
    }
    if (event is ContainerChanged) {
      return _onContainerChanged(event, emit);
    }
    if (event is CapacityChanged) {
      return _onCapacityChanged(event, emit);
    }
    if (event is WellTypeChanged) {
      return _onWellTypeChanged(event, emit);
    }
    if (event is WellDepthChanged) {
      return _onWellDepthChanged(event, emit);
    }
    if (event is UTMXChanged) {
      return _onUTMXChanged(event, emit);
    }
    if (event is UTMYChanged) {
      return _onUTMYChanged(event, emit);
    }
    if (event is LatDegreeChanged) {
      return _onLatDegreeChanged(event, emit);
    }
    if (event is LatMinuteChanged) {
      return _onLatMinuteChanged(event, emit);
    }
    if (event is LatSecondChanged) {
      return _onLatSecondChanged(event, emit);
    }
    if (event is LongDegreeChanged) {
      return _onLongDegreeChanged(event, emit);
    }
    if (event is LongMinuteChanged) {
      return _onLongMinuteChanged(event, emit);
    }
    if (event is LongSecondChanged) {
      return _onLongSecondChanged(event, emit);
    }
    if (event is WellScreenChanged) {
      return _onWellScreenChanged(event, emit);
    }
    if (event is WellThearChanged) {
      return _onWellThearChanged(event, emit);
    }
    if (event is WaterQualityChanged) {
      return _onWaterQualityChanged(event, emit);
    }
    if (event is NiVoStaticChanged) {
      return _onNiVoStaticChanged(event, emit);
    }
    if (event is NiVoDynamicChanged) {
      return _onNiVoDynamicChanged(event, emit);
    }
    if (event is CheckWaterQualityChanged) {
      return _onCheckWaterQualityChanged(event, emit);
    }
    if (event is WellStatusChanged) {
      return _onWellStatusChanged(event, emit);
    }
    if (event is AirPoolChanged) {
      return _onAirPoolChanged(event, emit);
    }
    if (event is FilterTankChanged) {
      return _onFilterTankChanged(event, emit);
    }
    if (event is PipeLenghtChanged) {
      return _onPipeLenghtChanged(event, emit);
    }
    if (event is PipeStatusChanged) {
      return _onPipeStatusChanged(event, emit);
    }
    if (event is ConnectorChanged) {
      return _onConnectorChanged(event, emit);
    }
    if (event is CoverageChanged) {
      return _onCoverageChanged(event, emit);
    }
    if (event is QualityWaterCheckChanged) {
      return _onQualityWaterCheckChanged(event, emit);
    }
    if (event is PondLatChanged) {
      return _onPondLatChanged(event, emit);
    }
    if (event is PondLongChanged) {
      return _onPondLongChanged(event, emit);
    }
    if (event is PondDepthChanged) {
      return _onPondDepthChanged(event, emit);
    }
    if (event is PondFilterChanged) {
      return _onPondFilterChanged(event, emit);
    }
    if (event is PondTypeChanged) {
      return _onPondTypeChanged(event, emit);
    }
    if (event is PondStatusChanged) {
      return _onPondStatusChanged(event, emit);
    }
    if (event is SeasonChanged) {
      return _onSeasonChanged(event, emit);
    }
    if (event is UsingTypeChanged) {
      return _onUsingTypeChanged(event, emit);
    }
    if (event is TankStatusChanged) {
      return _onTankStatusChanged(event, emit);
    }
    if (event is CapacityTypeChanged) {
      return _onCapacityTypeChanged(event, emit);
    }
    if (event is SupplierChanged) {
      return _onSupplierChanged(event, emit);
    }
    if (event is SupplierDateChanged) {
      return _onSupplierDateChanged(event, emit);
    }
    if (event is DueDateChanged) {
      return _onDueDateChanged(event, emit);
    }
    if (event is FilterChanged) {
      return _onFilterChanged(event, emit);
    }
    if (event is AirStationChanged) {
      return _onAirStationChanged(event, emit);
    }
    if (event is Submitted) {
      return _onSubmitted(event, emit);
    }

    if (event is WaterQualityParameterChanged) {
      return _onWaterQualityParameterChanged(event, emit);
    }
    if (event is AbilityProduceWaterChanged) {
      return _onAbilityProduceWaterChanged(event, emit);
    }
    if (event is KioskStatusChanged) {
      return _onKioskStatusChanged(event, emit);
    }
    if (event is KioskFilterChanged) {
      return _onKioskFilterChanged(event, emit);
    }

    if (event is GoogleMapPinChanged) {
      return _onGoogleMapPinChanged(event, emit);
    }
  }

  Future<void> _onWaterSupplyStarted(
    WaterSupplyStarted event,
    Emitter<WaterSupplyEditState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      List<ProvinceModel> provinces;
      final isDataEntry = Application.authBloc.state.user?.isDataEntry ?? false;
      if (isDataEntry) {
        final dataEntryProvinceId =
            Application.authBloc.state.user?.dataEntryProvinceId ?? 0;
        provinces =
            await repository.getProvincesByDataEntry(dataEntryProvinceId);
      } else {
        provinces = await repository.getProvinces();
      }

      if (state.id == 0) {
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd').format(now);
        emit(state.copyWith(
          status: BaseStatusEnum.success,
          provinces: provinces,
          mapTypeInput: MapTypeInput.pure(getMapTypeEnumById(1)),
          utmXInput: const WaterSupplyInput.pure('0'),
          utmYInput: const WaterSupplyInput.pure('0'),
          lateitudeInput: const WaterSupplyInput.pure('0'),
          longtitudeInput: const WaterSupplyInput.pure('0'),
          docInput: DOCInput.pure(DateTime.parse(formattedDate)),
        ));

        mapTypeController.text =
            getDisplayTextById(getMapTypeEnumById(1) ?? MapTypeEnum.utm);
        utmXController.text = '0';
        utmYController.text = '0';
        latetitudeController.text = '0';
        longtitudeController.text = '0';
        docController.text = formattedDate;

        return;
      }

      final waterSupply =
          await repository.getWaterSupplyDetail(state.waterSupplyTypeId);

      emit(state.copyWith(
        status: BaseStatusEnum.success,

        //!-- Tab 1
        waterSupply: waterSupply,
        provinces: provinces,
        districts:
            await repository.getDistrictByProvince(waterSupply.address.id),
        communes:
            await repository.getCommuneByDistrictId(waterSupply.district.id),
        villages:
            await repository.getVillageByCommuneId(waterSupply.commune.id),
        //mapType: getMapTypeEnumById(waterSupply.mapUnitId),
        waterSupplyTypeId: waterSupply.waterSupplyTypeId,

        provinceInput: WaterSupplyInput.pure(waterSupply.address.id.toString()),
        districtInput:
            WaterSupplyInput.pure(waterSupply.district.id.toString()),
        communeInput: WaterSupplyInput.pure(waterSupply.commune.id.toString()),
        villageInput: WaterSupplyInput.pure(waterSupply.village!.id.toString()),
        mapTypeInput:
            MapTypeInput.pure(getMapTypeEnumById(waterSupply.mapUnitId)),
        lateitudeInput: WaterSupplyInput.pure(waterSupply.decimalDegreeLat),
        longtitudeInput: WaterSupplyInput.pure(waterSupply.decimalDegreeLng),
        utmXInput: WaterSupplyInput.pure(waterSupply.utmX),
        utmYInput: WaterSupplyInput.pure(waterSupply.utmY),

        //!--- Tab 2
        familyTotalInput:
            WaterSupplyInput.pure(waterSupply.totalFamily.toString()),
        budgetTypeInput: BudgetTypeInput.pure(
            getBudgetTypeEnumById(waterSupply.sourceBudget)),
        locationRickInput: LocationRiskInput.pure(
            getAreaEnumById(waterSupply.isRiskEnviromentArea)),
        receiverFamilyTotalInput: WaterSupplyInput.pure(
            waterSupply.beneficiaryTotalFamily.toString()),
        receiverTotalAsFemaleInput:
            WaterSupplyInput.pure(waterSupply.beneficiaryTotalWoman.toString()),
        receiverTotalInput: WaterSupplyInput.pure(
            waterSupply.beneficiaryTotalPeople.toString()),
        receiverFamilyPoor1Input: WaterSupplyInput.pure(
            waterSupply.beneficiaryTotalFamilyPoor1.toString()),
        receiverFamilyPoor2Input: WaterSupplyInput.pure(
            waterSupply.beneficiaryTotalFamilyPoor2.toString()),
        receiverFamilyIndigenousInput: WaterSupplyInput.pure(
            waterSupply.beneficiaryTotalFamilyIndigenous.toString()),
        receiverFamilyVulnearableInput: WaterSupplyInput.pure(
            waterSupply.beneficiaryTotalFamilyVulnearable.toString()),
        constructionCodeInput:
            WaterSupplyInput.pure(waterSupply.waterSupplyCode),
        companyNameInput: WaterSupplyInput.pure(waterSupply.constructedBy),
        managementNameInput: WaterSupplyInput.pure(waterSupply.managedBy),
        managementTypeInput: ManagementTypeInput.pure(
            getManagementTypeEnumById(waterSupply.managementType)),

        docInput: DOCInput.pure(DateTime.parse(waterSupply.constructionDate)),
      ));

      provinceController.text = waterSupply.address.nameKh;
      districtController.text = waterSupply.district.nameKh;
      communeController.text = waterSupply.commune.nameKh;
      villageController.text = waterSupply.village!.nameKh;
      mapTypeController.text = getDisplayTextById(
          getMapTypeEnumById(waterSupply.mapUnitId) ?? MapTypeEnum.utm);
      latetitudeController.text =
          double.parse(waterSupply.decimalDegreeLat).toStringAsFixed(0);
      longtitudeController.text =
          double.parse(waterSupply.decimalDegreeLng).toStringAsFixed(0);
      utmXController.text = double.parse(waterSupply.utmX).toStringAsFixed(0);
      utmYController.text = double.parse(waterSupply.utmY).toStringAsFixed(0);
      //!-- Tab 2
      familyTotalController.text = waterSupply.totalFamily.toString();
      budgetTypeController.text = getBudgetTypeEnumDisplayText(
          getBudgetTypeEnumById(waterSupply.sourceBudget) ??
              BudgetTypeEnum.goverment);
      locationRickController.text = getAreaEnumDisplayText(
          getAreaEnumById(waterSupply.isRiskEnviromentArea) ?? AreaEnum.face);
      receiverFamilyTotalController.text =
          waterSupply.beneficiaryTotalPeople.toString();
      receiverTotalController.text =
          waterSupply.beneficiaryTotalFamily.toString();
      receiverTotalAsFemaleController.text =
          waterSupply.beneficiaryTotalWoman.toString();
      receiverFamilyPoor1Controller.text =
          waterSupply.beneficiaryTotalFamilyPoor1.toString();
      receiverFamilyPoor2Controller.text =
          waterSupply.beneficiaryTotalFamilyPoor2.toString();
      receiverFamilyMinorityController.text =
          waterSupply.beneficiaryTotalFamilyIndigenous.toString();
      receiverFamilyVictimController.text =
          waterSupply.beneficiaryTotalFamilyVulnearable.toString();
      constructionCodeController.text = waterSupply.waterSupplyCode.toString();
      companyNameController.text = waterSupply.constructedBy;
      managementNameController.text = waterSupply.managedBy;
      managementTypeController.text = getManagementTypeEnumDisplayText(
          getManagementTypeEnumById(waterSupply.managementType) ??
              ManagementTypeEnum.association);
      docController.text = waterSupply.constructionDate;

      switch (waterSupply.waterSupplyTypeId) {
        case 1:
          //----------- WELL
          final well = waterSupply.waterSupplyWells!.first;
          emit(state.copyWith(
            wellTypeInput: WellTypeInput.pure(
                getWellTypeEnumById(well.wellTypeObj.first.valueId)),
            wellDepthInput: WaterSupplyInput.pure(well.wellHeight),
            wellScreenInput: WaterSupplyInput.pure(well.wellFilterHeight),
            wellThearInput: WaterSupplyInput.pure(well.wellWaterSupply),
            niVoStaticInput: WaterSupplyInput.pure(well.wellNirostatic),
            niVoDynamicInput: WaterSupplyInput.pure(well.wellNirodynamic),
            waterQualityInput: WaterQualityInput.pure(
                getWaterQualityEnumById(well.wellWaterQualityObj!.first.id)),
            checkWaterQualityInput: CheckWaterQualityInput.pure(
                getCheckWaterQualityEnumById(
                    well.wellWaterQualityCheckObj!.first.id)),
            wellStatusInput: WellStatusInput.pure(
                getWellStatusEnumById(well.wellStatusObj!.first.id)),
          ));
          wellDepthController.text = well.wellHeight;
          wellScreenController.text = well.wellFilterHeight;
          wellThearController.text = well.wellWaterSupply;
          niVoStaticController.text = well.wellNirostatic;
          niVoDynamicController.text = well.wellNirodynamic;
          wellTypeController.text = getWellTypeDisplayText(
              getWellTypeEnumById(well.wellTypeObj.first.valueId) ??
                  WellTypeEnum.mixed);
          waterQualityController.text = getWaterQualityEnumDisplayText(
              getWaterQualityEnumById(well.wellWaterQualityObj!.first.id) ??
                  WaterQualityEnum.well);
          checkWaterQualityController.text =
              getCheckWaterQualityEnumDisplayText(getCheckWaterQualityEnumById(
                      well.wellWaterQualityCheckObj!.first.id) ??
                  CheckWaterQualityEnum.check);
          wellStatusController.text = getWellStatusEnumDisplayText(
              getWellStatusEnumById(well.wellStatusObj!.first.id) ??
                  WellStatusEnum.active);

          break;
        case 2: //!----- SMALL PIPE
          final smallPipe = waterSupply.waterSupplyPipes!.first;
          emit(state.copyWith(
            waterSupplyTypeInput: WaterSupplyTypeInput.pure(
                getWaterSupplyTypeEnumById(
                    smallPipe.sourceTypeOfWater.first.valueId)),
            containerInput:
                WaterSupplyInput.pure(smallPipe.underGroudPoolStorage),
            capacityInput:
                WaterSupplyInput.pure(smallPipe.abilityOfProductWater),
            airPoolInput: WaterSupplyInput.pure(smallPipe.poolAir),
            filterTankInput: PoolfilterInput.pure(
                getFilterEnumById(smallPipe.poolFilterObj.first.id)),
            connectorInput: WaterSupplyInput.pure(smallPipe.numberOfLink),
            checkWaterQualityInput: CheckWaterQualityInput.pure(
                getCheckWaterQualityEnumById(
                    smallPipe.wateQualityCheckObj.first.id)),
            pipeLenghtInput: WaterSupplyInput.pure(smallPipe.pipeLength),
            coverageInput: WaterSupplyInput.pure(smallPipe.areaCovering),
            pipeStatusInput: WellStatusInput.pure(
                getWellStatusEnumById(smallPipe.statusObj.first.id)),
          ));

          waterSupplyTypeController.text = getWaterSupplyTypeEnumDisplayText(
              getWaterSupplyTypeEnumById(
                      smallPipe.sourceTypeOfWater.first.valueId) ??
                  WaterSupplyTypeEnum.all);
          containerController.text = smallPipe.underGroudPoolStorage;
          capacityController.text = smallPipe.abilityOfProductWater;
          ariPoolController.text = smallPipe.poolAir;
          filterTankController.text = getFilterEnumDisplayText(
              getFilterEnumById(smallPipe.poolFilterObj.first.id) ??
                  FilterEnum.have);
          connectorController.text = smallPipe.numberOfLink;
          checkWaterQualityController.text =
              getCheckWaterQualityEnumDisplayText(getCheckWaterQualityEnumById(
                      smallPipe.wateQualityCheckObj.first.id) ??
                  CheckWaterQualityEnum.check);
          pipeLenghtController.text = smallPipe.pipeLength;
          coverageController.text = smallPipe.areaCovering;
          pipeStatusController.text = getWellStatusEnumDisplayText(
              getWellStatusEnumById(smallPipe.statusObj.first.id) ??
                  WellStatusEnum.active);

          break;
        //!---- KIOSK
        case 3:
          final kiosk = waterSupply.watersupplykiosks!.first;
          emit(state.copyWith(
            waterSupplyTypeInput: WaterSupplyTypeInput.pure(
                getWaterSupplyTypeEnumById(
                    kiosk.sourceTypeOfWater.first.valueId)),
            abilityProduceWaterInput:
                WaterSupplyInput.pure(kiosk.abilityOfProductWater),
            kioskFilter: PoolfilterInput.pure(
                getFilterEnumById(kiosk.filterSystemObj.first.id)),
            qualityWaterCheckInput: WaterQualityInput.pure(
                getWaterQualityEnumById(
                    kiosk.waterQualityCheckingObj.first.id)),
            kioskStatus: WellStatusInput.pure(
                getWellStatusEnumById(kiosk.statusObj.first.id)),
          ));
          waterSupplyTypeController.text = getWaterSupplyTypeEnumDisplayText(
              getWaterSupplyTypeEnumById(
                      kiosk.sourceTypeOfWater.first.valueId) ??
                  WaterSupplyTypeEnum.all);
          abilityProductWaterController.text = kiosk.abilityOfProductWater;
          kioskFilterController.text = getFilterEnumDisplayText(
              getFilterEnumById(kiosk.filterSystemObj.first.id) ??
                  FilterEnum.have);
          qualityWaterCheckController.text = getWaterQualityEnumDisplayText(
              getWaterQualityEnumById(kiosk.waterQualityCheckingObj.first.id) ??
                  WaterQualityEnum.well);
          kioskStatusController.text = getWellStatusEnumDisplayText(
              getWellStatusEnumById(kiosk.statusObj.first.id) ??
                  WellStatusEnum.active);

          break;
        case 4:
          //!-- POND
          final pond = waterSupply.waterSupplyCommunityPond!.first;
          emit(state.copyWith(
            pondLatInput: WaterSupplyInput.pure(pond.width),
            pondLongInput: WaterSupplyInput.pure(pond.length),
            pondDepthInput: WaterSupplyInput.pure(pond.height),
            pondFilterInput: PondfilterInput.pure(
                getPondFilterEnumById(pond.filterSystemObj.first.id)),
            pondTypeInput: PondTypeInput.pure(
                getPondTypeEnumById(pond.typeOfPondObj.first.id)),
            seasonInput: SeasonHasWaterInput.pure(
                getSeasonEnumbyId(pond.isSummerHasWaterObj.first.id)),
            pondStatusInput: PondStatusInput.pure(
                getPondStatusEnumById(pond.statusObj.first.id)),
          ));

          pondLatController.text = pond.width;
          pondLongController.text = pond.length;
          pondDepthController.text = pond.height;
          pondFilterController.text = getPondFilterEnumDisplayText(
              getPondFilterEnumById(pond.filterSystemObj.first.id) ??
                  PondFilterEnum.notHave);
          pondTypeController.text = getPondTypeEnumDisplayText(
              getPondTypeEnumById(pond.typeOfPondObj.first.id) ??
                  PondTypeEnum.concrete);
          seasonController.text = getSeasonEnumDisplayText(
              getSeasonEnumbyId(pond.isSummerHasWaterObj.first.id) ??
                  SeasonEnum.have);
          pondStatusController.text = getPondStatusEnumDisplayText(
              getPondStatusEnumById(pond.statusObj.first.id) ??
                  PondStatusEnum.maintain);

          break;
        case 5:
          //!---- RAIN WATER HARVESTING
          final rainwaterharvesting =
              waterSupply.waterSupplyRainWaterHarvesting!.first;
          emit(state.copyWith(
            usingTypeInput: UsingTypeInput.pure(
                getUsingTypeEnumById(rainwaterharvesting.typeOfUsing.first.id)),
            capacityTypeInput: CapacityInput.pure(getCapacityTypeEnumById(
                rainwaterharvesting.typeOfUsing.first.id)),
            checkWaterQualityInput: CheckWaterQualityInput.pure(
                getCheckWaterQualityEnumById(
                    rainwaterharvesting.waterQualityCheckObj.first.id)),
            tankStatusInput: TankStatusInput.pure(
                getTankStatusEnumById(rainwaterharvesting.statusObj.first.id)),
          ));

          usingTypeController.text = getUsingTypeEnumDisplayText(
              getUsingTypeEnumById(rainwaterharvesting.typeOfUsing.first.id) ??
                  UsingTypeEnum.family);
          capacityTypeController.text = getCapacityTypeEnumDisplayText(
              getCapacityTypeEnumById(
                      rainwaterharvesting.typeOfUsing.first.id) ??
                  CapacityTypeEnum.ml1);
          checkWaterQualityController.text =
              getCheckWaterQualityEnumDisplayText(getCheckWaterQualityEnumById(
                      rainwaterharvesting.waterQualityCheckObj.first.id) ??
                  CheckWaterQualityEnum.check);
          tankStatusController.text = getTankStatusEnumDisplayText(
              getTankStatusEnumById(rainwaterharvesting.statusObj.first.id) ??
                  TankStatusEnum.unUse);

          break;
        case 6:
          //!--------- PIPE
          final pipe = waterSupply.waterSupplyPipe!.first;
          emit(state.copyWith(
            waterSupplyTypeInput: WaterSupplyTypeInput.pure(
                getWaterSupplyTypeEnumById(pipe
                    .watersupplypipeoptionvalueWatersupplypipe!.first.valueId)),
            containerInput: WaterSupplyInput.pure(pipe.undergroundPoolStorage),
            capacityInput: WaterSupplyInput.pure(pipe.abiltyOfProduceWater),
            airPoolInput: WaterSupplyInput.pure(pipe.poolAir),
            filterTankInput: PoolfilterInput.pure(
                getFilterEnumById(pipe.poolFilterObj!.first.id)),
            connectorInput: WaterSupplyInput.pure(pipe.numberOfLink),
            checkWaterQualityInput: CheckWaterQualityInput.pure(
                getCheckWaterQualityEnumById(
                    pipe.pipeWaterQualityCheckObj!.first.id)),
            pipeLenghtInput: WaterSupplyInput.pure(pipe.pipeLength),
            coverageInput: WaterSupplyInput.pure(pipe.areaCovering),
            pipeStatusInput: WellStatusInput.pure(
                getWellStatusEnumById(pipe.pipeStatusObj!.first.id)),
            supplierInput: PoolfilterInput.pure(
              getFilterEnumById(pipe.isHasLicenseObj!.first.id),
            ),
            supplierDateInput:
                DOCInput.pure(DateTime.parse(pipe.licenseRegisteredDate)),
            dueDateInput:
                DOCInput.pure(DateTime.parse(pipe.licenseExpiredDate)),
          ));
          waterSupplyTypeController.text = getWaterSupplyTypeEnumDisplayText(
              getWaterSupplyTypeEnumById(pipe
                      .watersupplypipeoptionvalueWatersupplypipe!
                      .first
                      .valueId) ??
                  WaterSupplyTypeEnum.all);
          containerController.text = pipe.undergroundPoolStorage;
          capacityController.text = pipe.abiltyOfProduceWater;
          ariPoolController.text = pipe.poolAir;
          filterTankController.text = getFilterEnumDisplayText(
              getFilterEnumById(pipe.poolFilterObj!.first.id) ??
                  FilterEnum.have);
          connectorController.text = pipe.numberOfLink;
          checkWaterQualityController.text =
              getCheckWaterQualityEnumDisplayText(getCheckWaterQualityEnumById(
                      pipe.pipeWaterQualityCheckObj!.first.id) ??
                  CheckWaterQualityEnum.check);
          pipeLenghtController.text = pipe.pipeLength;
          coverageController.text = pipe.areaCovering;
          pipeStatusController.text = getWellStatusEnumDisplayText(
              getWellStatusEnumById(pipe.pipeStatusObj!.first.id) ??
                  WellStatusEnum.active);
          supplierDateController.text = pipe.licenseRegisteredDate;
          dueDateController.text = pipe.licenseExpiredDate;
          break;
        case 7:
          //!----- AIR to WATER
          final airToWater = waterSupply.waterSupplyAirWater?.first;
          emit(state.copyWith(
            waterSupplyTypeInput: WaterSupplyTypeInput.pure(
                getWaterSupplyTypeEnumById(
                    airToWater!.sourceTypeOfWater.first.valueId)),
            capacityInput:
                WaterSupplyInput.pure(airToWater.abiltyOfProduceWater),
            checkWaterQualityInput: CheckWaterQualityInput.pure(
                getCheckWaterQualityEnumById(
                    airToWater.waterQualityCheckObj!.first.id)),
            filterInput: PoolfilterInput.pure(
                getFilterEnumById(airToWater.filterSystemObj!.first.id)),
          ));

          waterSupplyTypeController.text = getWaterSupplyTypeEnumDisplayText(
              getWaterSupplyTypeEnumById(
                      airToWater.sourceTypeOfWater.first.valueId) ??
                  WaterSupplyTypeEnum.all);
          capacityController.text = airToWater.abiltyOfProduceWater;
          checkWaterQualityController.text =
              getCheckWaterQualityEnumDisplayText(getCheckWaterQualityEnumById(
                      airToWater.waterQualityCheckObj!.first.id) ??
                  CheckWaterQualityEnum.check);
          filterController.text = getFilterEnumDisplayText(
              getFilterEnumById(airToWater.filterSystemObj!.first.id) ??
                  FilterEnum.notHave);

          break;
      }
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  void _onProvinceChanged(
    ProvinceChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) async {
    //final province = WaterSupplyInput.pure(event.province.nameEn);
    final province = WaterSupplyInput.pure(event.province.id.toString());
    provinceController.text = event.province.nameKh;
    districtController.text = '';
    List<DistrictModel> districts =
        await repository.getDistrictByProvince(event.province.id);
    //provinceController.value=event.province.id as TextEditingValue;
    emit(state.copyWith(
      provinceInput: province,
      //districts: event.province.provincedistrict,
      districts: districts,
    ));
  }

  void _onDistrictChanged(
    DistrictChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) async {
    final distict = WaterSupplyInput.pure(event.district.id.toString());
    districtController.text = event.district.nameKh;
    communeController.text = '';
    emit(state.copyWith(
      districtInput: distict,
      //communes: event.district.districtCommnue,
      communes: await repository.getCommuneByDistrictId(event.district.id),
    ));
  }

  void _onCommuneChanged(
    CommnueChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) async {
    final commune = WaterSupplyInput.pure(event.commnue.id.toString());
    communeController.text = event.commnue.nameKh;
    villageController.text = '';
    emit(state.copyWith(
      communeInput: commune,
      //villages: event.commnue.commnuevillage,
      villages: await repository.getVillageByCommuneId(event.commnue.id),
    ));
  }

  void _onVillageChanged(
    VillageChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final village = WaterSupplyInput.pure(event.village.id.toString());
    villageController.text = event.village.nameKh;
    emit(state.copyWith(villageInput: village));
  }

  void _onMapTypeChanged(
    MapTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final mapType = MapTypeInput.pure(event.mapType);
    mapTypeController.text = event.mapType.getDisplayText();
    emit(state.copyWith(mapTypeInput: mapType));
  }

  void _onLatetitudeChanged(
    LatetitudeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final latetitude = WaterSupplyInput.pure(event.latetitude);
    emit(state.copyWith(lateitudeInput: latetitude));
  }

  void _onLongtitudeChanged(
    LongtitudeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final longtitude = WaterSupplyInput.pure(event.longtitude);
    emit(state.copyWith(longtitudeInput: longtitude));
  }

  //START Other Inforamtion Event
  void _onFamilyTotalChanged(
    FamilyTotalChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final familyTotal = WaterSupplyInput.pure(event.familyTotal);
    emit(state.copyWith(familyTotalInput: familyTotal));
  }

  void _onLocationRickChanged(
    LocationRickChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final locationRick = LocationRiskInput.pure(event.locationRick);
    locationRickController.text = event.locationRick.getDisplayText();
    emit(state.copyWith(locationRickInput: locationRick));
  }

  void _onBudgetTypeChanged(
    BudgetTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final budgetType = BudgetTypeInput.pure(event.budgetType);
    budgetTypeController.text = event.budgetType.getDisplayText();
    emit(state.copyWith(budgetTypeInput: budgetType));
  }

  void _onManagementTypeChanged(
    ManagementTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final managementType = ManagementTypeInput.pure(event.managementType);
    managementTypeController.text = event.managementType.getDisplayText();
    emit(state.copyWith(managementTypeInput: managementType));
  }

  void _onManagementNameChanged(
    ManagementNameChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final managementName = WaterSupplyInput.pure(event.managementName);
    emit(state.copyWith(managementNameInput: managementName));
  }

  void _onReceiverTotalChanged(
    ReceiverTotalChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverTotal = WaterSupplyInput.pure(event.receiverTotal);
    emit(state.copyWith(receiverTotalInput: receiverTotal));
  }

  void _onReceiverTotalAsFemaleChanged(
    ReceiverTotalAsFemaleChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverTotalAsFemale =
        WaterSupplyInput.pure(event.receiverTotalAsFemale);
    emit(state.copyWith(receiverTotalAsFemaleInput: receiverTotalAsFemale));
  }

  void _onReceiverFamilyTotalChanged(
    ReceiverFamilyTotalChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyTotal =
        WaterSupplyInput.pure(event.receiverFamilyTotal);
    emit(state.copyWith(receiverFamilyTotalInput: receiverFamilyTotal));
  }

  void _onReceiverFamilyPoor1Changed(
    ReceiverFamilyPoor1Changed event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyPoor1 =
        WaterSupplyInput.pure(event.receiverFamilyPoor1);
    emit(state.copyWith(receiverFamilyPoor1Input: receiverFamilyPoor1));
  }

  void _onReceiverFamilyPoor2Changed(
    ReceiverFamilyPoor2Changed event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyPoor2 =
        WaterSupplyInput.pure(event.receiverFamilyPoor2);
    emit(state.copyWith(receiverFamilyPoor2Input: receiverFamilyPoor2));
  }

  void _onDOCChanged(DOCChanged event, Emitter<WaterSupplyEditState> emit) {
    final dobInput = DOCInput.pure(event.doc);
    docController.text = DateHelper.formatDate(event.doc) ?? '';
    emit(state.copyWith(docInput: dobInput));
  }

  void _onCompanyNameChanged(
    CompanyNameChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final companyName = WaterSupplyInput.pure(event.companyName);
    emit(state.copyWith(companyNameInput: companyName));
  }

  void _onConstructionCodeChanged(
    ConstructionCodeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final constructionCode = WaterSupplyInput.pure(event.constructionCode);
    emit(state.copyWith(constructionCodeInput: constructionCode));
  }

  void _onReceiverFamilyMinorityChanged(
    ReceiverFamilyMinorityChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyMinority =
        WaterSupplyInput.pure(event.receiverFamilyMinority);
    emit(state.copyWith(receiverFamilyIndigenousInput: receiverFamilyMinority));
  }

  void _onReceiverFamilyVictimChanged(
    ReceiverFamilyVictimChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyVictim =
        WaterSupplyInput.pure(event.receiverFamilyVictim);
    emit(state.copyWith(receiverFamilyVulnearableInput: receiverFamilyVictim));
  }

  void _onWaterSupplyTypeChanged(
    WaterSupplyTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final waterSupplyType = WaterSupplyTypeInput.pure(event.waterSupplyType);
    waterSupplyTypeController.text = event.waterSupplyType.getDisplayText();
    emit(state.copyWith(waterSupplyTypeInput: waterSupplyType));
  }

  void _onContainerChanged(
    ContainerChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final container = WaterSupplyInput.pure(event.container);
    emit(state.copyWith(containerInput: container));
  }

  void _onCapacityChanged(
    CapacityChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final capacity = WaterSupplyInput.pure(event.capacity);
    emit(state.copyWith(capacityInput: capacity));
  }

  void _onWellTypeChanged(
    WellTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final wellType = WellTypeInput.pure(event.wellType);
    wellTypeController.text = event.wellType.getDisplayText();
    emit(state.copyWith(wellTypeInput: wellType));
  }

  void _onWellDepthChanged(
    WellDepthChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final wellDepth = WaterSupplyInput.pure(event.wellDepth);
    emit(state.copyWith(wellDepthInput: wellDepth));
  }

  void _onUTMXChanged(
    UTMXChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final utmx = WaterSupplyInput.pure(event.utmx);
    emit(state.copyWith(utmXInput: utmx));
  }

  void _onUTMYChanged(
    UTMYChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final utmy = WaterSupplyInput.pure(event.utmy);
    emit(state.copyWith(utmYInput: utmy));
  }

  void _onLatDegreeChanged(
    LatDegreeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final latDegree = WaterSupplyInput.pure(event.latDegree);
    emit(state.copyWith(latDegreeInput: latDegree));
  }

  void _onLatMinuteChanged(
    LatMinuteChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final latMinute = WaterSupplyInput.pure(event.latMinute);
    emit(state.copyWith(latDegreeInput: latMinute));
  }

  void _onLatSecondChanged(
    LatSecondChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final latSecond = WaterSupplyInput.pure(event.latSecond);
    emit(state.copyWith(latSecondInput: latSecond));
  }

  void _onLongDegreeChanged(
    LongDegreeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final longDegree = WaterSupplyInput.pure(event.longDegree);
    emit(state.copyWith(longDegreeInput: longDegree));
  }

  void _onLongMinuteChanged(
    LongMinuteChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final longMinute = WaterSupplyInput.pure(event.longMinute);
    emit(state.copyWith(longMinuteInput: longMinute));
  }

  void _onLongSecondChanged(
    LongSecondChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final longSecond = WaterSupplyInput.pure(event.longSecond);
    emit(state.copyWith(longSecondInput: longSecond));
  }

  void _onWellScreenChanged(
    WellScreenChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final wellScreen = WaterSupplyInput.pure(event.wellScreen);
    emit(state.copyWith(wellScreenInput: wellScreen));
  }

  void _onWellThearChanged(
    WellThearChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final wellThear = WaterSupplyInput.pure(event.wellThear);
    emit(state.copyWith(wellThearInput: wellThear));
  }

  void _onWaterQualityChanged(
    WaterQualityChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final waterQuality = WaterQualityInput.pure(event.waterQuality);
    waterQualityController.text = event.waterQuality.getDisplayText();
    emit(state.copyWith(waterQualityInput: waterQuality));
  }

  void _onNiVoStaticChanged(
    NiVoStaticChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final niVoStatic = WaterSupplyInput.pure(event.niVoStatic);
    emit(state.copyWith(niVoStaticInput: niVoStatic));
  }

  void _onNiVoDynamicChanged(
    NiVoDynamicChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final niVoDynamic = WaterSupplyInput.pure(event.niVoDynamic);
    emit(state.copyWith(niVoDynamicInput: niVoDynamic));
  }

  void _onCheckWaterQualityChanged(
    CheckWaterQualityChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final checkWaterQuality =
        CheckWaterQualityInput.pure(event.checkWaterQuality);
    checkWaterQualityController.text = event.checkWaterQuality.getDisplayText();
    emit(state.copyWith(checkWaterQualityInput: checkWaterQuality));
  }

  void _onWellStatusChanged(
    WellStatusChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final wellStatus = WellStatusInput.pure(event.wellStatus);
    wellStatusController.text = event.wellStatus.getDisplayText();
    emit(state.copyWith(wellStatusInput: wellStatus));
  }

  void _onKioskStatusChanged(
    KioskStatusChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final kioskStatus = WellStatusInput.pure(event.kioskStatus);
    kioskStatusController.text = event.kioskStatus.getDisplayText();
    emit(state.copyWith(kioskStatus: kioskStatus));
  }

  void _onAirPoolChanged(
    AirPoolChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final airPool = WaterSupplyInput.pure(event.airPool);
    emit(state.copyWith(airPoolInput: airPool));
  }

  void _onFilterTankChanged(
    FilterTankChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final filterTank = PoolfilterInput.pure(event.filterTank);
    filterTankController.text = event.filterTank.getDisplayText();
    emit(state.copyWith(filterTankInput: filterTank));
  }

  void _onPipeLenghtChanged(
    PipeLenghtChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final pipeLenght = WaterSupplyInput.pure(event.pipeLenght);
    emit(state.copyWith(pipeLenghtInput: pipeLenght));
  }

  void _onConnectorChanged(
    ConnectorChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final connector = WaterSupplyInput.pure(event.connector);
    emit(state.copyWith(connectorInput: connector));
  }

  void _onPipeStatusChanged(
    PipeStatusChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final pipeStatus = WellStatusInput.pure(event.pipeStatus);
    pipeStatusController.text = event.pipeStatus.getDisplayText();
    emit(state.copyWith(pipeStatusInput: pipeStatus));
  }

  void _onCoverageChanged(
    CoverageChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final coverage = WaterSupplyInput.pure(event.coverage);
    emit(state.copyWith(coverageInput: coverage));
  }

  void _onQualityWaterCheckChanged(
    QualityWaterCheckChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final quality = WaterQualityInput.pure(event.quality);
    qualityWaterCheckController.text = event.quality.getDisplayText();
    emit(state.copyWith(qualityWaterCheckInput: quality));
  }

  void _onPondLatChanged(
    PondLatChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final pondLat = WaterSupplyInput.pure(event.pondLat);
    emit(state.copyWith(pondLatInput: pondLat));
  }

  void _onPondLongChanged(
    PondLongChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final pondLong = WaterSupplyInput.pure(event.pondLong);
    emit(state.copyWith(pondLongInput: pondLong));
  }

  void _onPondTypeChanged(
    PondTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final pondType = PondTypeInput.pure(event.pondType);
    //pondTypeController.text = event.pondType.getDisplayText();
    pondTypeController.text = event.pondType.getDisplayText();
    emit(state.copyWith(pondTypeInput: pondType));
  }

  void _onPondDepthChanged(
    PondDepthChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final pondDepth = WaterSupplyInput.pure(event.pondDepth);
    emit(state.copyWith(pondDepthInput: pondDepth));
  }

  void _onPondFilterChanged(
    PondFilterChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    //final pondFilter = WaterSupplyInput.pure(event.pondFilter);
    //pondFilterController.text = event.pondFilter;
    final pondFilter = PondfilterInput.pure(event.pondFilter);
    pondFilterController.text = event.pondFilter.getDisplayText();
    //pondFilterController.text = 'មិនមាន';
    emit(state.copyWith(pondFilterInput: pondFilter));
  }

  void _onSeasonChanged(
    SeasonChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final season = SeasonHasWaterInput.pure(event.season);
    seasonController.text = event.season.getDisplayText();
    emit(state.copyWith(seasonInput: season));
  }

  void _onPondStatusChanged(
    PondStatusChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    //final pondStatus = WaterSupplyInput.pure(event.pondStatus);
    final pondStatus = PondStatusInput.pure(event.pondStatus);
    pondStatusController.text = event.pondStatus.getDisplayText();
    //pondStatusController.text = 'មិនប្រើប្រាស់';
    emit(state.copyWith(pondStatusInput: pondStatus));
  }

  void _onUsingTypeChanged(
    UsingTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final usingType = UsingTypeInput.pure(event.usingType);
    usingTypeController.text = event.usingType.getDisplayText();
    emit(state.copyWith(usingTypeInput: usingType));
  }

  void _onTankStatusChanged(
    TankStatusChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final tankStatus = TankStatusInput.pure(event.tankStatus);
    tankStatusController.text = event.tankStatus.getDisplayText();
    emit(state.copyWith(tankStatusInput: tankStatus));
  }

  void _onCapacityTypeChanged(
    CapacityTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final capacityType = CapacityInput.pure(event.capacityType);
    capacityTypeController.text = event.capacityType.getDisplayText();
    emit(state.copyWith(capacityTypeInput: capacityType));
  }

  void _onSupplierChanged(
    SupplierChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final supplier = PoolfilterInput.pure(event.supplier);
    supplierController.text = event.supplier.getDisplayText();
    emit(state.copyWith(supplierInput: supplier));
  }

  void _onSupplierDateChanged(
    SupplierDateChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final dateInput = DOCInput.pure(event.supplierDate);
    supplierDateController.text =
        DateHelper.formatDate(event.supplierDate) ?? '';
    emit(state.copyWith(supplierDateInput: dateInput));
  }

  void _onDueDateChanged(
    DueDateChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final dueDate = DOCInput.pure(event.dueDate);
    dueDateController.text = DateHelper.formatDate(event.dueDate) ?? '';
    emit(state.copyWith(dueDateInput: dueDate));
  }

  void _onFilterChanged(
    FilterChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final filter = PoolfilterInput.pure(event.filter);
    filterController.text = event.filter.getDisplayText();
    emit(state.copyWith(filterInput: filter));
  }

  void _onAirStationChanged(
    AirStationChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final airStation = WellStatusInput.pure(event.airStation);
    airStationController.text = event.airStation.getDisplayText();
    emit(state.copyWith(airStationInput: airStation));
  }

  void _onAbilityProduceWaterChanged(
      AbilityProduceWaterChanged event, Emitter<WaterSupplyEditState> emit) {
    final abilityProduceWater =
        WaterSupplyInput.pure(event.abilityProductWater);
    emit(state.copyWith(abilityProduceWaterInput: abilityProduceWater));
  }

  void _onKioskFilterChanged(
      KioskFilterChanged event, Emitter<WaterSupplyEditState> emit) {
    final kioskFilter = PoolfilterInput.pure(event.kioskFilter);
    kioskFilterController.text = event.kioskFilter.getDisplayText();
    emit(state.copyWith(kioskFilter: kioskFilter));
  }

  void _onWaterQualityParameterChanged(
      WaterQualityParameterChanged event, Emitter<WaterSupplyEditState> emit) {
    final param1 = WaterSupplyInput.pure(event.value);
    parameter1Controller.text = event.value;
    emit(state.copyWith(wqParameter1: param1));
  }

  void _onGoogleMapPinChanged(
      GoogleMapPinChanged event, Emitter<WaterSupplyEditState> emit) {
    LatLng latLng = event.latLng;
    LatLongConverter converter = LatLongConverter();
    OSRef result = converter.getOSGBfromDec(
        latLng.latitude, latLng.longitude, Datums.WGS84);
    latetitudeController.text = result.northing.toString();
    longtitudeController.text = result.easting.toString();
    utmXController.text = latLng.latitude.toString();
    utmYController.text = latLng.longitude.toString();
    // latetitudeController.text = latLng.latitude.toString();
    // longtitudeController.text = latLng.longitude.toString();
    emit(state.copyWith(
        latLng: latLng,
        lateitudeInput: WaterSupplyInput.pure(result.northing.toString()),
        longtitudeInput: WaterSupplyInput.pure(result.easting.toString()),
        utmXInput: WaterSupplyInput.pure(latLng.latitude.toString()),
        utmYInput: WaterSupplyInput.pure(latLng.longitude.toString())));
  }

  void _onSubmitted(
    Submitted event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final waterSupplyStatus = event.waterSupplyStatus;
    final provinceInput = WaterSupplyInput.dirty(state.provinceInput.value);
    final districtInput = WaterSupplyInput.dirty(state.districtInput.value);
    final communeInput = WaterSupplyInput.dirty(state.communeInput.value);
    final villageInput = WaterSupplyInput.dirty(state.villageInput.value);
    final mapTypeInput = MapTypeInput.dirty(state.mapTypeInput.value);
    final waterSupplyCodeInput =
        WaterSupplyInput.dirty(state.waterSupplyCode.value);
    final familyTotalInput =
        WaterSupplyInput.dirty(state.familyTotalInput.value);
    final lateitudeInput = WaterSupplyInput.dirty(state.lateitudeInput.value);
    final longtitudeInput = WaterSupplyInput.dirty(state.longtitudeInput.value);
    final locationRickInput =
        LocationRiskInput.dirty(state.locationRickInput.value);
    final budgetTypeInput = BudgetTypeInput.dirty(state.budgetTypeInput.value);
    final managementTypeInput =
        ManagementTypeInput.dirty(state.managementTypeInput.value);
    final managementNameInput =
        WaterSupplyInput.dirty(state.managementNameInput.value);
    final receiverTotalInput =
        WaterSupplyInput.dirty(state.receiverTotalInput.value);
    final receiverTotalAsFemaleInput =
        WaterSupplyInput.dirty(state.receiverTotalAsFemaleInput.value);
    final receiverFamilyTotalInput =
        WaterSupplyInput.dirty(state.receiverFamilyTotalInput.value);
    final receiverFamilyPoor1Input =
        WaterSupplyInput.dirty(state.receiverFamilyPoor1Input.value);
    final receiverFamilyPoor2Input =
        WaterSupplyInput.dirty(state.receiverFamilyPoor2Input.value);
    final docInput = DOCInput.dirty(state.docInput.value);
    final companyNameInput =
        WaterSupplyInput.dirty(state.companyNameInput.value);
    final constructionCodeInput =
        WaterSupplyInput.dirty(state.constructionCodeInput.value);
    final receiverFamilyIndigenousInput =
        WaterSupplyInput.dirty(state.receiverFamilyIndigenousInput.value);
    final receiverFamilyVulnearableInput =
        WaterSupplyInput.dirty(state.receiverFamilyVulnearableInput.value);
    final waterSupplyTypeInput =
        WaterSupplyTypeInput.dirty(state.waterSupplyTypeInput.value);

    final utmXInput = WaterSupplyInput.dirty(state.utmXInput.value);
    final utmYInput = WaterSupplyInput.dirty(state.utmYInput.value);
    final latDegreeInput = WaterSupplyInput.dirty(state.latDegreeInput.value);
    final latMinuteInput = WaterSupplyInput.dirty(state.latMinuteInput.value);
    final latSecondInput = WaterSupplyInput.dirty(state.latSecondInput.value);
    final longDegreeInput = WaterSupplyInput.dirty(state.longDegreeInput.value);
    final longMinuteInput = WaterSupplyInput.dirty(state.longMinuteInput.value);
    final longSecondInput = WaterSupplyInput.dirty(state.longSecondInput.value);

    //Start Well
    final wellTypeInput = WellTypeInput.dirty(state.wellTypeInput.value);
    final wellDepthInput = WaterSupplyInput.dirty(state.wellDepthInput.value);
    final wellScreenInput = WaterSupplyInput.dirty(state.wellScreenInput.value);
    final wellThearInput = WaterSupplyInput.dirty(state.wellThearInput.value);
    final waterQualityInput =
        WaterQualityInput.dirty(state.waterQualityInput.value);
    final niVoStaticInput = WaterSupplyInput.dirty(state.niVoStaticInput.value);
    final niVoDynamicInput =
        WaterSupplyInput.dirty(state.niVoDynamicInput.value);
    final checkWaterQualityInput =
        CheckWaterQualityInput.dirty(state.checkWaterQualityInput.value);
    final wellStatusInput = WellStatusInput.dirty(state.wellStatusInput.value);
    //End Well

    //Start Small Pipe
    //final sourceOfWaterInput = WaterSupplyTypeInput.dirty(state.waterSupplyTypeInput.value);
    final airPoolInput = WaterSupplyInput.dirty(state.airPoolInput.value);
    final filterTankInput = PoolfilterInput.dirty(state.filterTankInput.value);
    final connectorInput = WaterSupplyInput.dirty(state.connectorInput.value);
    final containerInput = WaterSupplyInput.dirty(state.containerInput.value);
    final capacityInput = WaterSupplyInput.dirty(state.capacityInput.value);
    final pipeLenghtInput = WaterSupplyInput.dirty(state.pipeLenghtInput.value);
    final pipeStatusInput = WellStatusInput.dirty(state.pipeStatusInput.value);
    final coverageInput = WaterSupplyInput.dirty(state.coverageInput.value);
    final qualityWaterCheckInput =
        WaterQualityInput.dirty(state.qualityWaterCheckInput.value);
    //End Pipe (Small Pipe)

    //Start Pond
    final pondLatInput = WaterSupplyInput.dirty(state.pondLatInput.value);
    final pondLongInput = WaterSupplyInput.dirty(state.pondLongInput.value);
    final pondDepthInput = WaterSupplyInput.dirty(state.pondDepthInput.value);
    //final pondFilterInput = WaterSupplyInput.dirty(state.pondFilterInput.value.toString());
    final pondFilterInput = PondfilterInput.dirty(state.pondFilterInput.value);
    //final pondTypeInput = WaterSupplyInput.dirty(state.pondTypeInput.value);
    final pondTypeInput = PondTypeInput.dirty(state.pondTypeInput.value);
    final seasonInput = SeasonHasWaterInput.dirty(state.seasonInput.value);
    //final pondStatusInput = WaterSupplyInput.dirty(state.pondStatusInput.value);
    final pondStatusInput = PondStatusInput.dirty(state.pondStatusInput.value);

    final usingTypeInput = UsingTypeInput.dirty(state.usingTypeInput.value);
    final capacityTypeInput =
        CapacityInput.dirty(state.capacityTypeInput.value);
    final tankStatusInput = TankStatusInput.dirty(state.tankStatusInput.value);
    final supplierInput = PoolfilterInput.dirty(state.supplierInput.value);
    final supplierDateInput = DOCInput.dirty(state.supplierDateInput.value);
    final dueDateInput = DOCInput.dirty(state.dueDateInput.value);
    final filterInput = PoolfilterInput.dirty(state.filterInput.value);
    final airStationInput = WellStatusInput.dirty(state.airStationInput.value);

    final abilityProductWaterInput =
        WaterSupplyInput.dirty(state.abilityProduceWaterInput.value);
    final kioskStatusInput = WellStatusInput.dirty(state.kioskStatus.value);
    final kioskFilterInput = PoolfilterInput.dirty(state.kioskFilter.value);

    // ------Start Pipe
    //final waterSupplyTypeInput = WaterSupplyTypeInput.dirty(state.waterSupplyTypeInput.value);
    //final airPoolInput = WaterSupplyInput.dirty(state.airPoolInput.value);
    //final filterTankInput = PoolfilterInput.dirty(state.filterTankInput.value);
    //final connectorInput = WaterSupplyInput.dirty(state.connectorInput.value);
    //final containerInput = WaterSupplyInput.dirty(state.containerInput.value);
    //final capacityInput = WaterSupplyInput.dirty(state.capacityInput.value);
    //final pipeLenghtInput = WaterSupplyInput.dirty(state.pipeLenghtInput.value);
    //final pipeStatusInput = WellStatusInput.dirty(state.pipeStatusInput.value);
    //final coverageInput = WaterSupplyInput.dirty(state.coverageInput.value);
    //final qualityWaterCheckInput = WaterQualityInput.dirty(state.qualityWaterCheckInput.value);

    //final dueDateInput = DOCInput.dirty(state.dueDateInput.value);

    // ------End Pipe

    //Start Air

    //End Air

    final wqParameter1Input = WaterSupplyInput.dirty(state.wqParameter1.value);

    FormzStatus? validForm;

    if (state.waterSupplyTypeId == 1) {
      validForm = Formz.validate([
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        budgetTypeInput,
        locationRickInput,
        managementTypeInput,
        receiverTotalInput,
        receiverFamilyTotalInput,
        receiverTotalAsFemaleInput,
        receiverFamilyPoor1Input,
        receiverFamilyPoor2Input,
        receiverFamilyIndigenousInput,
        receiverFamilyVulnearableInput,
        docInput,
        wellTypeInput,
        waterQualityInput,
        checkWaterQualityInput,
        wellStatusInput
      ]);
    } else if (state.waterSupplyTypeId == 2) {
      validForm = Formz.validate([
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        budgetTypeInput,
        locationRickInput,
        managementTypeInput,
        receiverTotalInput,
        receiverFamilyTotalInput,
        receiverTotalAsFemaleInput,
        receiverFamilyPoor1Input,
        receiverFamilyPoor2Input,
        receiverFamilyIndigenousInput,
        receiverFamilyVulnearableInput,
        docInput,
        waterSupplyTypeInput,
        filterTankInput,
        pipeStatusInput,
        qualityWaterCheckInput
      ]);
    } else if (state.waterSupplyTypeId == 3) {
      validForm = Formz.validate([
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        budgetTypeInput,
        locationRickInput,
        managementTypeInput,
        receiverTotalInput,
        receiverFamilyTotalInput,
        receiverTotalAsFemaleInput,
        receiverFamilyPoor1Input,
        receiverFamilyPoor2Input,
        receiverFamilyIndigenousInput,
        receiverFamilyVulnearableInput,
        docInput,
      ]);
    } else if (state.waterSupplyTypeId == 4) {
      validForm = Formz.validate([
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        budgetTypeInput,
        locationRickInput,
        managementTypeInput,
        receiverTotalInput,
        receiverFamilyTotalInput,
        receiverTotalAsFemaleInput,
        receiverFamilyPoor1Input,
        receiverFamilyPoor2Input,
        receiverFamilyIndigenousInput,
        receiverFamilyVulnearableInput,
        docInput,
      ]);
    } else if (state.waterSupplyTypeId == 5) {
      validForm = Formz.validate([
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        budgetTypeInput,
        locationRickInput,
        managementTypeInput,
        receiverTotalInput,
        receiverFamilyTotalInput,
        receiverTotalAsFemaleInput,
        receiverFamilyPoor1Input,
        receiverFamilyPoor2Input,
        receiverFamilyIndigenousInput,
        receiverFamilyVulnearableInput,
        docInput,
        checkWaterQualityInput
      ]);
    } else if (state.waterSupplyTypeId == 6) {
      validForm = Formz.validate([
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        budgetTypeInput,
        locationRickInput,
        managementTypeInput,
        receiverTotalInput,
        receiverFamilyTotalInput,
        receiverTotalAsFemaleInput,
        receiverFamilyPoor1Input,
        receiverFamilyPoor2Input,
        receiverFamilyIndigenousInput,
        receiverFamilyVulnearableInput,
        docInput,
        waterSupplyTypeInput,
        checkWaterQualityInput,
        pipeStatusInput
      ]);
    } else if (state.waterSupplyTypeId == 7) {
      validForm = Formz.validate([
        provinceInput,
        districtInput,
        communeInput,
        villageInput,
        budgetTypeInput,
        locationRickInput,
        managementTypeInput,
        receiverTotalInput,
        receiverFamilyTotalInput,
        receiverTotalAsFemaleInput,
        receiverFamilyPoor1Input,
        receiverFamilyPoor2Input,
        receiverFamilyIndigenousInput,
        receiverFamilyVulnearableInput,
        docInput,
        waterSupplyTypeInput,
        checkWaterQualityInput
      ]);
    }

    emit(state.copyWith(
      provinceInput: provinceInput,
      districtInput: districtInput,
      communeInput: communeInput,
      villageInput: villageInput,
      mapTypeInput: mapTypeInput,
      familyTotalInput: familyTotalInput,
      lateitudeInput: lateitudeInput,
      longtitudeInput: longtitudeInput,
      locationRickInput: locationRickInput,
      budgetTypeInput: budgetTypeInput,
      managementTypeInput: managementTypeInput,
      managementNameInput: managementNameInput,
      receiverTotalInput: receiverTotalInput,
      receiverTotalAsFemaleInput: receiverTotalAsFemaleInput,
      receiverFamilyTotalInput: receiverFamilyTotalInput,
      receiverFamilyPoor1Input: receiverFamilyPoor1Input,
      receiverFamilyPoor2Input: receiverFamilyPoor2Input,
      docInput: docInput,
      companyNameInput: companyNameInput,
      constructionCodeInput: constructionCodeInput,
      receiverFamilyIndigenousInput: receiverFamilyIndigenousInput,
      receiverFamilyVulnearableInput: receiverFamilyVulnearableInput,
      waterSupplyTypeInput: waterSupplyTypeInput,
      containerInput: containerInput,
      capacityInput: capacityInput,
      utmXInput: utmXInput,
      utmYInput: utmYInput,
      latDegreeInput: latDegreeInput,
      latMinuteInput: latMinuteInput,
      latSecondInput: latSecondInput,
      longDegreeInput: longDegreeInput,
      longMinuteInput: longMinuteInput,
      longSecondInput: longSecondInput,
      wellTypeInput: wellTypeInput,
      wellDepthInput: wellDepthInput,
      wellScreenInput: wellScreenInput,
      wellThearInput: wellThearInput,
      waterQualityInput: waterQualityInput,
      niVoStaticInput: niVoStaticInput,
      niVoDynamicInput: niVoDynamicInput,
      checkWaterQualityInput: checkWaterQualityInput,
      wellStatusInput: wellStatusInput,
      airPoolInput: airPoolInput,
      filterTankInput: filterTankInput,
      connectorInput: connectorInput,
      pipeLenghtInput: pipeLenghtInput,
      pipeStatusInput: pipeStatusInput,
      coverageInput: coverageInput,
      qualityWaterCheckInput: qualityWaterCheckInput,
      pondLatInput: pondLatInput,
      pondLongInput: pondLongInput,
      pondDepthInput: pondDepthInput,
      pondFilterInput: pondFilterInput,
      pondTypeInput: pondTypeInput,
      seasonInput: seasonInput,
      pondStatusInput: pondStatusInput,
      usingTypeInput: usingTypeInput,
      capacityTypeInput: capacityTypeInput,
      tankStatusInput: tankStatusInput,
      supplierInput: supplierInput,
      supplierDateInput: supplierDateInput,
      dueDateInput: dueDateInput,
      filterInput: filterInput,
      airStationInput: airStationInput,
      formzStatus: validForm,
      waterSupplyCode: waterSupplyCodeInput,
      wqParameter1: wqParameter1Input,
      abilityProduceWaterInput: abilityProductWaterInput,
      kioskStatus: kioskStatusInput,
      kioskFilter: kioskFilterInput,
    ));

    if (state.formzStatus.isValidated) {
      LoadingHelper.show();
      emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
      Future.delayed(const Duration(microseconds: 500));

      //try {

      final user = Application.authBloc.state.user;
      final province = provinceInput.value;
      //print(province);
      final isRiskLocation = locationRickInput.value?.getCode();

      final isWaterQualityCheck =
          checkWaterQualityInput.value?.getCode() == 0 ? true : false;

      final constructionDateInputSplit = docInput.value.toString().split(' ');
      int editWaterSupplyId = 0;

      if (state.id > 0) {
        editWaterSupplyId = state.waterSupply!.id;
      }

      final payload = PayloadWaterSupplyModel(
        createdBy: user != null ? user.id : 0,
        // createdAt: DateTime.now(),
        // createdAt1: DateTime.now(),
        province: int.parse(province),
        district: int.parse(districtInput.value),
        commune: int.parse(communeInput.value),
        village: int.parse(villageInput.value),
        mapUnitId: mapTypeInput.value?.getCode() ?? 1,
        decimalDegreeLat: lateitudeInput.value.isNotEmpty
            ? double.parse(lateitudeInput.value)
            : 0,
        decimalDegreeLng: longtitudeInput.value.isNotEmpty
            ? double.parse(longtitudeInput.value)
            : 0,
        utmX: utmXInput.value.isNotEmpty ? double.parse(utmXInput.value) : 0,
        utmY: utmYInput.value.isNotEmpty ? double.parse(utmYInput.value) : 0,
        mdsXDegree: latDegreeInput.value.isNotEmpty
            ? double.parse(latDegreeInput.value)
            : 0,
        mdsXMinute: latMinuteInput.value.isNotEmpty
            ? double.parse(latMinuteInput.value)
            : 0,
        mdsXSecond: latSecondInput.value.isNotEmpty
            ? double.parse(latSecondInput.value)
            : 0,
        mdsYDegree: longDegreeInput.value.isNotEmpty
            ? double.parse(longDegreeInput.value)
            : 0,
        mdsYMinute: longMinuteInput.value.isNotEmpty
            ? double.parse(longMinuteInput.value)
            : 0,
        mdsYSecond: longSecondInput.value.isNotEmpty
            ? double.parse(longSecondInput.value)
            : 0,
        totalFamily: familyTotalInput.value.isNotEmpty
            ? int.parse(familyTotalInput.value)
            : 0,
        beneficiaryTotalFamily: receiverFamilyTotalInput.value.isNotEmpty
            ? int.parse(receiverFamilyTotalInput.value)
            : 0,
        beneficiaryTotalFamilyIndigenous:
            receiverFamilyIndigenousInput.value.isNotEmpty
                ? int.parse(receiverFamilyIndigenousInput.value)
                : 0,
        beneficiaryTotalFamilyPoor1: receiverFamilyPoor1Input.value.isNotEmpty
            ? int.parse(receiverFamilyPoor1Input.value)
            : 0,
        beneficiaryTotalFamilyPoor2: receiverFamilyPoor2Input.value.isNotEmpty
            ? int.parse(receiverFamilyPoor2Input.value)
            : 0,
        beneficiaryTotalFamilyVulnearable:
            receiverFamilyVulnearableInput.value.isNotEmpty
                ? int.parse(receiverFamilyVulnearableInput.value)
                : 0,
        beneficiaryTotalPeople: receiverTotalInput.value.isNotEmpty
            ? int.parse(receiverTotalInput.value)
            : 0,
        beneficiaryTotalWoman: receiverTotalAsFemaleInput.value.isNotEmpty
            ? int.parse(receiverTotalAsFemaleInput.value)
            : 0,
        constructedBy: companyNameInput.value,

        constructionDate: constructionDateInputSplit[0], //'2023-05-16', // ,
        isRiskEnviromentArea: isRiskLocation == 1 ? true : false,
        managedBy: managementNameInput.value,
        managementType: managementTypeInput.value?.getCode() ?? 0,
        sourceBudget: budgetTypeInput.value?.getCode() ?? 0,
        waterSupplyTypeId: state.waterSupplyTypeId,
        isActive: true,
        updatedBy: user != null ? user.id : 0,
        mainStatus: waterSupplyStatus,
        waterSupplyCode: constructionCodeInput.value, //not yet have control yet
        isWaterQualityCheck: isWaterQualityCheck,
        id: editWaterSupplyId,
      );

      print(payload);

      repository
          .addOrUpdateWaterSupply(id: state.id, payload: payload)
          .then((watersupply) {
        final waterSupplyId = watersupply.waterSupplyId;
        //print(waterSupplyId);

        /* QRCODE SECTION */
        repository.getGenerateQRCodeResponse(waterSupplyId).then((qrcode) {
          final payloadWaterSupplyQRCode = PayloadWaterSupplyQRCodeModel(
              waterSupplyId: waterSupplyId, qrCodeImageName: qrcode.qrName);
          repository.addWaterSupplyQRCode(payload: payloadWaterSupplyQRCode);

          /* START WATER QUALITY PARAMETER */
          if (isWaterQualityCheck) {
            final payloadWQParameter1 = PayloadWaterQualityParameterModel(
                value: wqParameter1Input.value == ''
                    ? '0'
                    : wqParameter1Input.value,
                isActive: true,
                waterSupplyId: waterSupplyId,
                parameterId: 1);

            repository.addWaterQuanlityParameter(payload: payloadWQParameter1);

            for (var i = 2; i <= 16; i++) {
              final payloadWQParameter = PayloadWaterQualityParameterModel(
                  value: '0',
                  isActive: true,
                  waterSupplyId: waterSupplyId,
                  parameterId: i);

              repository.addWaterQuanlityParameter(payload: payloadWQParameter);
            }
          }

          //START WELL
          if (state.waterSupplyTypeId == 1) {
            final payloadWell = PayloadWellModel(
              waterSupplyId: waterSupplyId,
              wellType: wellTypeInput.value?.getCode().toString() ?? '',
              wellHeight: wellDepthInput.value,
              wellFilterHeight: wellScreenInput.value,
              wellWaterSupply: wellThearInput.value,
              wellNiroStatic: niVoStaticInput.value,
              wellNiroDynamic: niVoDynamicInput.value,
              wellStatus: wellStatusInput.value?.getCode() == 0 ? '12' : '13',
              wellStatusReason: '',
              wellWaterQuality:
                  waterQualityInput.value?.getCode() == 0 ? '8' : '9',
              wellWaterQualityCheck:
                  checkWaterQualityInput.value?.getCode() == 0 ? '10' : '11',
              isActive: true,
            );
            repository.addWaterSupplyWell(payload: payloadWell).then((well) {
              //WELL TYPE
              final payloadWellOptionValue = PayloadWellOptionValueModel(
                  waterSupplyWellId: well.id ?? 0,
                  optionId: 1,
                  valueId: wellTypeInput.value?.getCode() ?? 0,
                  isActive: true);
              repository.addWaterSupplyWellOptionValue(
                payload: payloadWellOptionValue,
              );
            });
          }
          //Small PIPE
          else if (state.waterSupplyTypeId == 2) {
            final payloadSmallPipe = PayloadSmallPipeModel(
              waterSupplyId: waterSupplyId,
              isActive: true,
              sourceTypeOfWater:
                  waterSupplyTypeInput.value?.getCode().toString() ?? '',
              abilityOfProductWater: capacityInput.value,
              undergroupPoolStorage: containerInput.value,
              poolAir: airPoolInput.value,
              poolFilter: filterTankInput.value?.getCode() == 0 ? '18' : '19',
              numberOfLink: connectorInput.value,
              waterQualityCheck:
                  qualityWaterCheckInput.value?.getCode() == 0 ? '10' : '11',
              status: pipeStatusInput.value?.getCode() == 0 ? '22' : '23',
              statusNoReason: '',
            );
            repository
                .addWaterSupplySmallPipe(payload: payloadSmallPipe)
                .then((smallpipe) {
              final payloadPipeOptionValue = PayloadSmallPipeOptionValueModel(
                  waterSupplyWellId: smallpipe.id ?? 0,
                  optionId: 1,
                  valueId: waterSupplyTypeInput.value?.getCode() ?? 0,
                  isActive: true);
              repository.addWaterSupplySmallPipeOptionValue(
                  payload: payloadPipeOptionValue);
            });
          }
          //KIOSK
          else if (state.waterSupplyTypeId == 3) {
            final payloadKiosk = PayloadKioskModel(
              waterSupplyId: waterSupplyId,
              isActive: true,
              sourceTypeOfWater:
                  waterSupplyTypeInput.value?.getCode().toString() ?? '',
              abilityOfProductWater: abilityProductWaterInput.value,
              filterSystem:
                  kioskFilterInput.value?.getCode() == 0 ? '28' : '29',
              status: kioskStatusInput.value?.getCode() == 0 ? '26' : '27',
              statusNoReason: '',
              waterQualityChecking:
                  qualityWaterCheckInput.value?.getCode() == 0 ? '24' : '25',
            );
            repository.addWaterSupplyKiosk(payload: payloadKiosk).then((kiosk) {
              final payloadKioskOptionValue = PayloadKioskOptionValueModel(
                isActive: true,
                optionId: 11,
                valueId: waterSupplyTypeInput.value?.getCode() ?? 0,
                waterSupplyKioskId: kiosk.id ?? 0,
              );
              try {
                repository.addWaterSupplyKioskOptionValue(
                    payload: payloadKioskOptionValue);
              } catch (_) {}
            });
          }
          //Pond
          else if (state.waterSupplyTypeId == 4) {
            var pondStatus = pondStatusInput.value?.getCode();
            final payloadPond = PayloadPondModel(
              waterSupplyId: waterSupplyId,
              width: pondLatInput.value,
              length: pondLongInput.value,
              height: pondDepthInput.value,
              //poolFilter: pondFilterInput.value?.getCode()==0 ? '0':'1', wellTypeInput.value?.getCode().toString() ?? '',
              poolFilter: pondFilterInput.value?.getCode() == 0 ? '30' : '31',
              status: pondStatus == 0
                  ? '36'
                  : pondStatus == 1
                      ? '37'
                      : '38',
              statusNoReason: '',
              isActive: true,
              typeOfPond: pondTypeInput.value?.getCode() == 0 ? '32' : '33',
              isSummerHasWater: seasonInput.value?.getCode() == 0 ? '34' : '35',
              //poolFilterObj: ''
            );
/*               repository.addWaterSupplyPond(payload: payloadPond).then((pond){
                final payloadPondOptionValue = PayloadPondOptionValueModel(
                  waterSupplyWellId: pond.id?? 0,
                  optionId: 1,
                  valueId: waterSupplyTypeInput.value?.getCode()?? 0,
                  isActive: true);
              repository.addWaterSupplyPondOptionValue(payload: payloadPondOptionValue);    
              });
              repository.addWaterSupplyPond(payload: payloadPond); */

            repository.addWaterSupplyPond(payload: payloadPond);
          }
          //Rain
          else if (state.waterSupplyTypeId == 5) {
            var typeOfUsing = usingTypeInput.value?.getCode();
            var capacity = capacityTypeInput.value?.getCode();
            final payloadRain = PayloadRainModel(
              waterSupplyId: waterSupplyId,
              typeOfUsing: typeOfUsing == 0
                  ? '39'
                  : typeOfUsing == 1
                      ? '40'
                      : '41',
              capacityOfRainWaterHarvesting: capacity == 0
                  ? '45'
                  : capacity == 1
                      ? '46'
                      : capacity == 2
                          ? '47'
                          : capacity == 3
                              ? '48'
                              : '49',
              status: tankStatusInput.value?.getCode() == 1 ? '42' : '43',
              statusNoReason: '',
              isActive: true,
              waterQualityChecking:
                  checkWaterQualityInput.value?.getCode() == 0 ? '50' : '51',
              capacity35m3: 0,
              capacity4m3: 0,
            );
            //print(payloadRain);
            repository.addWaterSupplyRain(payload: payloadRain);
          } else if (state.waterSupplyTypeId == 6) {
            var licenseRegisteredDateSplit =
                supplierDateInput.value.toString().split(' ');
            var licenseExpiredDateSplit =
                dueDateInput.value.toString().split(' ');
            final payloadPipeModel = PayloadPipeModel(
              waterSupplyId: waterSupplyId,
              isActive: true,
              sourceTypeOfWater:
                  waterSupplyTypeInput.value?.getCode().toString() ?? '',
              abilityOfProductWater: capacityInput.value,
              undergroupPoolStorage: containerInput.value,
              poolAir: airPoolInput.value,
              poolFilter: filterTankInput.value?.getCode() == 0 ? '18' : '19',
              numberOfLink: connectorInput.value,
              waterQualityCheck:
                  qualityWaterCheckInput.value?.getCode() == 0 ? '10' : '11',
              status: pipeStatusInput.value?.getCode() == 0 ? '22' : '23',
              statusNoReason: '',
              pipeLength: pipeLenghtInput.value,
              areaCovering: coverageInput.value,
              isHasLicense: supplierInput.value?.getCode() == 0 ? '52' : '53',
              // licenseExpiredDate:dueDateInput.value.toString(), // docInput.value,
              // licenseRegisteredDate:supplierDateInput.value.toString()
              licenseExpiredDate: licenseExpiredDateSplit[0], // docInput.value,
              licenseRegisteredDate: licenseRegisteredDateSplit[0],
            );
            print(payloadPipeModel);
            repository
                .addWaterSupplyPipe(payload: payloadPipeModel)
                .then((pipe) {
              final payloadPipeOptionValue = PayloadPipeOptionValueModel(
                  waterSupplyPipeId: pipe.id ?? 0,
                  optionId: 1,
                  valueId: waterSupplyTypeInput.value?.getCode() ?? 0,
                  isActive: true);
              repository.addWaterSupplyPipeOptionValue(
                  payload: payloadPipeOptionValue);
            });
          }
          //!-- AIR to Water
          else if (state.waterSupplyTypeId == 7) {
            var sourceTypeOfWater = waterSupplyTypeInput.value?.getCode();
            final payloadAir = PayloadairModel(
                waterSupplyId: waterSupplyId,
                sourceTypeOfWater: sourceTypeOfWater.toString(),
                abiltyOfProduceWater: capacityInput.value,
                filterSystem:
                    filterTankInput.value?.getCode() == 0 ? '28' : '29',
                waterQualityChecking:
                    qualityWaterCheckInput.value?.getCode() == 0 ? '10' : '11',
                status: tankStatusInput.value?.getCode() == 1 ? '26' : '27',
                statusNoReason: '',
                isActive: true);
            repository.addWaterSupplyAir(payload: payloadAir).then((pond) {
              final payloadAirOptionValue = PayloadairOptionValueModel(
                  waterSupplyWellId: pond.id ?? 0,
                  optionId: 1,
                  valueId: waterSupplyTypeInput.value?.getCode() ?? 0,
                  isActive: true);
              repository.addWaterSupplyAirOptionValue(
                  payload: payloadAirOptionValue);
            });
          }
          //DialogHelper.showAnimatedDialog(pageBuilder: );
        });
      });

      LoadingHelper.close();
      Application.eventBus.fire(const WaterSupplyUpdated());
      emit(state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          waterSupplyTypeId: state.waterSupplyTypeId));

      // } catch (_) {
      //   emit(state.copyWith(formzStatus: FormzStatus.submissionFailure));
      // } finally {
      //   LoadingHelper.close();

      //   Application.eventBus.fire(const WaterSupplyUpdated());
      //   emit(state.copyWith(formzStatus: FormzStatus.submissionSuccess));
      // }
    }
  }
}
