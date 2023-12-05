import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/filter/repositories/filter_water_supply_repository.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';

part 'filter_state.dart';
part 'filter_event.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({
    required this.repository,
    required int waterSupplyTypeId,
  }) : super(FilterState.initial(waterSupplyTypeId: waterSupplyTypeId)) {
    on<FilterEvent>(_onFilterEvent);
  }

  final FilterWaterSupplyRepository repository;
  final FocusNode waterSupplyCodeFocus = FocusNode();
  final waterSupplyCodeController = TextEditingController();
  final FocusNode provinceFocus = FocusNode();
  final provinceController = TextEditingController();
  final FocusNode districtFocus = FocusNode();
  final districtController = TextEditingController();
  final FocusNode communeFocus = FocusNode();
  final communeController = TextEditingController();
  final FocusNode villageFocus = FocusNode();
  final villageController = TextEditingController();

  Future<void> _onFilterEvent(
      FilterEvent event, Emitter<FilterState> emit) async {
    if (event is FilterStarted) {
      return _onFilterStarted(event, emit);
    }
    if (event is WaterSupplyCodeChanged) {
      return _onConstructionCodeChanged(event, emit);
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
  }

  Future<void> _onFilterStarted(
      FilterEvent event, Emitter<FilterState> emit) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      List<ProvinceModel> provinces;
      emit(state.copyWith(status: BaseStatusEnum.success));
      provinces = await repository.getProvinces();
      emit(
          state.copyWith(provinces: provinces, status: BaseStatusEnum.success));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  void _onConstructionCodeChanged(
    WaterSupplyCodeChanged event,
    Emitter<FilterState> emit,
  ) {
    final constructionCode = WaterSupplyInput.pure(event.waterSupplyCode);
    emit(state.copyWith(waterSupplyCodeInput: constructionCode));
  }

  void _onProvinceChanged(
    ProvinceChanged event,
    Emitter<FilterState> emit,
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
        provinceId: event.province.id.toString()));
  }

  void _onDistrictChanged(
    DistrictChanged event,
    Emitter<FilterState> emit,
  ) async {
    final distict = WaterSupplyInput.pure(event.district.id.toString());
    districtController.text = event.district.nameKh;
    communeController.text = '';
    emit(state.copyWith(
      districtInput: distict,
      //communes: event.district.districtCommnue,
      disctrictId: event.district.id.toString(),
      communes: await repository.getCommuneByDistrictId(event.district.id),
    ));
  }

  void _onCommuneChanged(
    CommnueChanged event,
    Emitter<FilterState> emit,
  ) async {
    final commune = WaterSupplyInput.pure(event.commnue.id.toString());
    communeController.text = event.commnue.nameKh;
    villageController.text = '';
    emit(state.copyWith(
      communeInput: commune,
      //villages: event.commnue.commnuevillage,
      communeId: event.commnue.id.toString(),
      villages: await repository.getVillageByCommuneId(event.commnue.id),
    ));
  }

  void _onVillageChanged(
    VillageChanged event,
    Emitter<FilterState> emit,
  ) {
    final village = WaterSupplyInput.pure(event.village.id.toString());
    villageController.text = event.village.nameKh;
    emit(state.copyWith(
        villageId: event.village.id.toString(), villageInput: village));
  }
}
