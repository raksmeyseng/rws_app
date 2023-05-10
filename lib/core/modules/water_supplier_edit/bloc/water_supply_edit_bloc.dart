import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/doc_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/repositories/water_supply_edit_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/utils/helpers/date_helper.dart';

part 'water_supply_edit_event.dart';
part 'water_supply_edit_state.dart';

class WaterSupplyEditBloc
    extends Bloc<WaterSupplyEditEvent, WaterSupplyEditState> {
  WaterSupplyEditBloc({
    required this.repository,
    required int waterSupplyId,
  }) : super(WaterSupplyEditState.initial(waterSupplyId: waterSupplyId)) {
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
  }

  Future<void> _onWaterSupplyStarted(
    WaterSupplyStarted event,
    Emitter<WaterSupplyEditState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      // final waterSupply =
      //     await repository.getWaterSupplyDetail(state.waterSupplyId);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        // waterSupply: waterSupply,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  void _onProvinceChanged(
    ProvinceChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final province = WaterSupplyInput.pure(event.province);
    provinceController.text = event.province;
    emit(state.copyWith(
      provinceInput: province,
    ));
  }

  void _onDistrictChanged(
    DistrictChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final distict = WaterSupplyInput.pure(event.district);
    districtController.text = event.district;
    emit(state.copyWith(
      districtInput: distict,
    ));
  }

  void _onCommuneChanged(
    CommnueChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final commune = WaterSupplyInput.pure(event.commnue);
    communeController.text = event.commnue;
    emit(state.copyWith(
      communeInput: commune,
    ));
  }

  void _onVillageChanged(
    VillageChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final village = WaterSupplyInput.pure(event.village);
    villageController.text = event.village;
    emit(state.copyWith(
      villageInput: village,
    ));
  }

  void _onMapTypeChanged(
    MapTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final mapType = WaterSupplyInput.pure(event.mapType);
    mapTypeController.text = event.mapType;
    emit(state.copyWith(
      mapTypeInput: mapType,
    ));
  }

  void _onLatetitudeChanged(
    LatetitudeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final latetitude = WaterSupplyInput.pure(event.latetitude);
    emit(state.copyWith(
      lateitudeInput: latetitude,
    ));
  }

  void _onLongtitudeChanged(
    LongtitudeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final longtitude = WaterSupplyInput.pure(event.longtitude);
    emit(state.copyWith(
      longtitudeInput: longtitude,
    ));
  }

  void _onFamilyTotalChanged(
    FamilyTotalChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final familyTotal = WaterSupplyInput.pure(event.familyTotal);
    emit(state.copyWith(
      familyTotalInput: familyTotal,
    ));
  }

  void _onLocationRickChanged(
    LocationRickChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final locationRick = WaterSupplyInput.pure(event.locationRick);
    locationRickController.text = event.locationRick;
    emit(state.copyWith(
      locationRickInput: locationRick,
    ));
  }

  void _onBudgetTypeChanged(
    BudgetTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final budgetType = WaterSupplyInput.pure(event.budgetType);
    budgetTypeController.text = event.budgetType;
    emit(state.copyWith(
      budgetTypeInput: budgetType,
    ));
  }

  void _onManagementTypeChanged(
    ManagementTypeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final managementType = WaterSupplyInput.pure(event.managementType);
    managementTypeController.text = event.managementType;
    emit(state.copyWith(
      managementTypeInput: managementType,
    ));
  }

  void _onManagementNameChanged(
    ManagementNameChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final managementName = WaterSupplyInput.pure(event.managementName);
    emit(state.copyWith(
      managementNameInput: managementName,
    ));
  }

  void _onReceiverTotalChanged(
    ReceiverTotalChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverTotal = WaterSupplyInput.pure(event.receiverTotal);
    emit(state.copyWith(
      receiverTotalInput: receiverTotal,
    ));
  }

  void _onReceiverTotalAsFemaleChanged(
    ReceiverTotalAsFemaleChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverTotalAsFemale =
        WaterSupplyInput.pure(event.receiverTotalAsFemale);
    emit(state.copyWith(
      receiverTotalAsFemaleInput: receiverTotalAsFemale,
    ));
  }

  void _onReceiverFamilyTotalChanged(
    ReceiverFamilyTotalChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyTotal =
        WaterSupplyInput.pure(event.receiverFamilyTotal);
    emit(state.copyWith(
      receiverFamilyTotalInput: receiverFamilyTotal,
    ));
  }

  void _onReceiverFamilyPoor1Changed(
    ReceiverFamilyPoor1Changed event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyPoor1 =
        WaterSupplyInput.pure(event.receiverFamilyPoor1);
    emit(state.copyWith(
      receiverFamilyPoor1Input: receiverFamilyPoor1,
    ));
  }

  void _onReceiverFamilyPoor2Changed(
    ReceiverFamilyPoor2Changed event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyPoor2 =
        WaterSupplyInput.pure(event.receiverFamilyPoor2);
    emit(state.copyWith(
      receiverFamilyPoor2Input: receiverFamilyPoor2,
    ));
  }

  void _onDOCChanged(DOCChanged event, Emitter<WaterSupplyEditState> emit) {
    final dobInput = DOCInput.pure(event.doc);
    docController.text = DateHelper.formatDate(event.doc) ?? '';
    emit(state.copyWith(
      docInput: dobInput,
    ));
  }

  void _onCompanyNameChanged(
    CompanyNameChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final companyName = WaterSupplyInput.pure(event.companyName);
    emit(state.copyWith(
      companyNameInput: companyName,
    ));
  }

  void _onConstructionCodeChanged(
    ConstructionCodeChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final constructionCode = WaterSupplyInput.pure(event.constructionCode);
    emit(state.copyWith(
      constructionCodeInput: constructionCode,
    ));
  }

  void _onReceiverFamilyMinorityChanged(
    ReceiverFamilyMinorityChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyMinority =
        WaterSupplyInput.pure(event.receiverFamilyMinority);
    emit(state.copyWith(
      receiverFamilyMinorityInput: receiverFamilyMinority,
    ));
  }

  void _onReceiverFamilyVictimChanged(
    ReceiverFamilyVictimChanged event,
    Emitter<WaterSupplyEditState> emit,
  ) {
    final receiverFamilyVictim =
        WaterSupplyInput.pure(event.receiverFamilyVictim);
    emit(state.copyWith(
      receiverFamilyVictimInput: receiverFamilyVictim,
    ));
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
}
