import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/budget_type.dart';
import 'package:rws_app/core/enum/management_type.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/budget_type_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/doc_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/management_type_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/payload_water_supply_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/repositories/water_supply_edit_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/utils/helpers/date_helper.dart';
import 'package:rws_app/utils/helpers/loading_helper.dart';

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
  }

  Future<void> _onWaterSupplyStarted(
    WaterSupplyStarted event,
    Emitter<WaterSupplyEditState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      final provinces = await repository.getProvinces();
      if (state.id == 0) {
        emit(state.copyWith(
          status: BaseStatusEnum.success,
          provinces: provinces,
        ));
        return;
      }
      final waterSupply =
          await repository.getWaterSupplyDetail(state.waterSupplyTypeId);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        waterSupply: waterSupply,
        provinces: provinces,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  void _onProvinceChanged(
    ProvinceChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final province = WaterSupplyInput.pure(event.province.nameEn);
    provinceController.text = event.province.nameEn;
    districtController.text = '';
    emit(state.copyWith(
      provinceInput: province,
      districts: event.province.provincedistrict,
    ));
  }

  void _onDistrictChanged(
    DistrictChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final distict = WaterSupplyInput.pure(event.district.nameEn);
    districtController.text = event.district.nameEn;
    communeController.text = '';
    emit(state.copyWith(
      districtInput: distict,
      communes: event.district.districtCommnue,
    ));
  }

  void _onCommuneChanged(
    CommnueChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final commune = WaterSupplyInput.pure(event.commnue.nameEn);
    communeController.text = event.commnue.nameEn;
    villageController.text = '';
    emit(state.copyWith(
      communeInput: commune,
      villages: event.commnue.commnuevillage,
    ));
  }

  void _onVillageChanged(
    VillageChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final village = WaterSupplyInput.pure(event.village.nameEn);
    villageController.text = event.village.nameEn;
    emit(state.copyWith(villageInput: village));
  }

  void _onMapTypeChanged(
    MapTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final mapType = WaterSupplyInput.pure(event.mapType);
    mapTypeController.text = event.mapType;
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
    final locationRick = WaterSupplyInput.pure(event.locationRick);
    locationRickController.text = event.locationRick;
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
    final waterSupplyType = WaterSupplyInput.pure(event.waterSupplyType);
    waterSupplyTypeController.text = event.waterSupplyType;
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
    final wellType = WaterSupplyInput.pure(event.wellType);
    wellTypeController.text = event.wellType;
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
    final waterQuality = WaterSupplyInput.pure(event.waterQuality);
    waterQualityController.text = event.waterQuality;
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
    final checkWaterQuality = WaterSupplyInput.pure(event.checkWaterQuality);
    checkWaterQualityController.text = event.checkWaterQuality;
    emit(state.copyWith(checkWaterQualityInput: checkWaterQuality));
  }

  void _onWellStatusChanged(
    WellStatusChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final wellStatus = WaterSupplyInput.pure(event.wellStatus);
    wellStatusController.text = event.wellStatus;
    emit(state.copyWith(wellStatusInput: wellStatus));
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
    final filterTank = WaterSupplyInput.pure(event.filterTank);
    filterTankController.text = event.filterTank;
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
    final pipeStatus = WaterSupplyInput.pure(event.pipeStatus);
    pipeStatusController.text = event.pipeStatus;
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
    final quality = WaterSupplyInput.pure(event.quality);
    qualityWaterCheckController.text = event.quality;
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
    final pondType = WaterSupplyInput.pure(event.pondType);
    pondTypeController.text = event.pondType;
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
    final pondFilter = WaterSupplyInput.pure(event.pondFilter);
    pondFilterController.text = event.pondFilter;
    emit(state.copyWith(pondFilterInput: pondFilter));
  }

  void _onSeasonChanged(
    SeasonChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final season = WaterSupplyInput.pure(event.season);
    seasonController.text = event.season;
    emit(state.copyWith(seasonInput: season));
  }

  void _onPondStatusChanged(
    PondStatusChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final pondStatus = WaterSupplyInput.pure(event.pondStatus);
    pondStatusController.text = event.pondStatus;
    emit(state.copyWith(pondStatusInput: pondStatus));
  }

  void _onUsingTypeChanged(
    UsingTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final usingType = WaterSupplyInput.pure(event.usingType);
    usingTypeController.text = event.usingType;
    emit(state.copyWith(usingTypeInput: usingType));
  }

  void _onTankStatusChanged(
    TankStatusChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final tankStatus = WaterSupplyInput.pure(event.tankStatus);
    tankStatusController.text = event.tankStatus;
    emit(state.copyWith(tankStatusInput: tankStatus));
  }

  void _onCapacityTypeChanged(
    CapacityTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final capacityType = WaterSupplyInput.pure(event.capacityType);
    capacityTypeController.text = event.capacityType;
    emit(state.copyWith(capacityTypeInput: capacityType));
  }

  void _onSupplierChanged(
    SupplierChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final supplier = WaterSupplyInput.pure(event.supplier);
    supplierController.text = event.supplier;
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
    final filter = WaterSupplyInput.pure(event.filter);
    filterController.text = event.filter;
    emit(state.copyWith(filterInput: filter));
  }

  void _onAirStationChanged(
    AirStationChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final airStation = WaterSupplyInput.pure(event.airStation);
    airStationController.text = event.airStation;
    emit(state.copyWith(airStationInput: airStation));
  }

  void _onSubmitted(
    Submitted event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final provinceInput = WaterSupplyInput.dirty(state.provinceInput.value);
    final districtInput = WaterSupplyInput.dirty(state.districtInput.value);
    final communeInput = WaterSupplyInput.dirty(state.communeInput.value);
    final villageInput = WaterSupplyInput.dirty(state.villageInput.value);
    final mapTypeInput = WaterSupplyInput.dirty(state.mapTypeInput.value);
    final familyTotalInput =
        WaterSupplyInput.dirty(state.familyTotalInput.value);
    final lateitudeInput = WaterSupplyInput.dirty(state.lateitudeInput.value);
    final longtitudeInput = WaterSupplyInput.dirty(state.longtitudeInput.value);
    final locationRickInput =
        WaterSupplyInput.dirty(state.locationRickInput.value);
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
        WaterSupplyInput.dirty(state.waterSupplyTypeInput.value);
    final containerInput = WaterSupplyInput.dirty(state.containerInput.value);
    final capacityInput = WaterSupplyInput.dirty(state.capacityInput.value);
    final wellTypeInput = WaterSupplyInput.dirty(state.wellTypeInput.value);
    final wellDepthInput = WaterSupplyInput.dirty(state.wellDepthInput.value);
    final utmXInput = WaterSupplyInput.dirty(state.utmXInput.value);
    final utmYInput = WaterSupplyInput.dirty(state.utmYInput.value);
    final latDegreeInput = WaterSupplyInput.dirty(state.latDegreeInput.value);
    final latMinuteInput = WaterSupplyInput.dirty(state.latMinuteInput.value);
    final latSecondInput = WaterSupplyInput.dirty(state.latSecondInput.value);
    final longDegreeInput = WaterSupplyInput.dirty(state.longDegreeInput.value);
    final longMinuteInput = WaterSupplyInput.dirty(state.longMinuteInput.value);
    final longSecondInput = WaterSupplyInput.dirty(state.longSecondInput.value);
    final wellScreenInput = WaterSupplyInput.dirty(state.wellScreenInput.value);
    final wellThearInput = WaterSupplyInput.dirty(state.wellThearInput.value);
    final waterQualityInput =
        WaterSupplyInput.dirty(state.waterQualityInput.value);
    final niVoStaticInput = WaterSupplyInput.dirty(state.niVoStaticInput.value);
    final niVoDynamicInput =
        WaterSupplyInput.dirty(state.niVoDynamicInput.value);
    final checkWaterQualityInput =
        WaterSupplyInput.dirty(state.checkWaterQualityInput.value);
    final wellStatusInput = WaterSupplyInput.dirty(state.wellStatusInput.value);
    final airPoolInput = WaterSupplyInput.dirty(state.airPoolInput.value);
    final filterTankInput = WaterSupplyInput.dirty(state.filterTankInput.value);
    final connectorInput = WaterSupplyInput.dirty(state.connectorInput.value);
    final pipeLenghtInput = WaterSupplyInput.dirty(state.pipeLenghtInput.value);
    final pipeStatusInput = WaterSupplyInput.dirty(state.pipeStatusInput.value);
    final coverageInput = WaterSupplyInput.dirty(state.coverageInput.value);
    final qualityWaterCheckInput =
        WaterSupplyInput.dirty(state.qualityWaterCheckInput.value);
    final pondLatInput = WaterSupplyInput.dirty(state.pondLatInput.value);
    final pondLongInput = WaterSupplyInput.dirty(state.pondLongInput.value);
    final pondDepthInput = WaterSupplyInput.dirty(state.pondDepthInput.value);
    final pondFilterInput = WaterSupplyInput.dirty(state.pondFilterInput.value);
    final pondTypeInput = WaterSupplyInput.dirty(state.pondTypeInput.value);
    final seasonInput = WaterSupplyInput.dirty(state.seasonInput.value);
    final pondStatusInput = WaterSupplyInput.dirty(state.pondStatusInput.value);
    final usingTypeInput = WaterSupplyInput.dirty(state.usingTypeInput.value);
    final capacityTypeInput =
        WaterSupplyInput.dirty(state.capacityTypeInput.value);
    final tankStatusInput = WaterSupplyInput.dirty(state.tankStatusInput.value);
    final supplierInput = WaterSupplyInput.dirty(state.supplierInput.value);
    final supplierDateInput = DOCInput.dirty(state.supplierDateInput.value);
    final dueDateInput = DOCInput.dirty(state.dueDateInput.value);
    final filterInput = WaterSupplyInput.dirty(state.filterInput.value);
    final airStationInput = WaterSupplyInput.dirty(state.airStationInput.value);

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
    } else if (state.waterSupplyTypeId == 2 || state.waterSupplyTypeId == 3) {
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
      wellTypeInput: wellTypeInput,
      wellDepthInput: wellDepthInput,
      utmXInput: utmXInput,
      utmYInput: utmYInput,
      latDegreeInput: latDegreeInput,
      latMinuteInput: latMinuteInput,
      latSecondInput: latSecondInput,
      longDegreeInput: longDegreeInput,
      longMinuteInput: longMinuteInput,
      longSecondInput: longSecondInput,
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
    ));

    if (state.formzStatus.isValidated) {
      LoadingHelper.show();
      emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
      try {
        final user = Application.authBloc.state.user;
        final payload = PayloadWaterSupplyModel(
          createdBy: user != null ? user.username : '',
          createdAt: DateTime.now(),
          createdAt1: DateTime.now(),
          province: 0,
          district: 0,
          commune: 0,
          village: 0,
          mapUnitId: 0,
          decimalDegreeLat: lateitudeInput.value,
          decimalDegreeLng: longtitudeInput.value,
          utmX: utmXInput.value,
          utmY: utmYInput.value,
          mdsXDegree: latDegreeInput.value,
          mdsXMinute: latMinuteInput.value,
          mdsXSecond: latSecondInput.value,
          mdsYDegree: longDegreeInput.value,
          mdsYMinute: longMinuteInput.value,
          mdsYSecond: longSecondInput.value,
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
          constructionDate: docInput.value,
          isRiskEnviromentArea: false,
          managedBy: managementNameInput.value,
          managementType: managementTypeInput.value?.getCode() ?? 0,
          sourceBudget: budgetTypeInput.value?.getCode() ?? 0,
          waterSupplyTypeId: state.waterSupplyTypeId,
        );
        repository.addOrUpdateWaterSupply(
          id: state.id,
          payload: payload,
        );
        emit(state.copyWith(formzStatus: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(formzStatus: FormzStatus.submissionFailure));
      } finally {
        LoadingHelper.close();
      }
    }
  }
}
