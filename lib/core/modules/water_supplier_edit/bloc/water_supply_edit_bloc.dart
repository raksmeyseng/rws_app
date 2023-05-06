import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';
import 'package:rws_app/core/modules/water_supplier_edit/repositories/water_supply_edit_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';

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
  final FocusNode receiverTotalFocus = FocusNode();
  final receiverTotalController = TextEditingController();
  final FocusNode receiverFamilyTotalFocus = FocusNode();
  final receiverFamilyTotalController = TextEditingController();
  final FocusNode receiverFamilyPoor2Focus = FocusNode();
  final receiverFamilyPoor2Controller = TextEditingController();

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
}
