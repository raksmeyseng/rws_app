import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/water_supplier_edit/model/water_supply_input.dart';

part 'filter_state.dart';
part 'filter_event.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({
    required int waterSupplyTypeId,
  }) : super(FilterState.initial(waterSupplyTypeId: waterSupplyTypeId)) {
    on<FilterEvent>(_onFilterEvent);
  }

  final FocusNode waterSupplyCodeFocus = FocusNode();
  final waterSupplyCodeController = TextEditingController();

  Future<void> _onFilterEvent(
      FilterEvent event, Emitter<FilterState> emit) async {
    if (event is FilterStarted) {
      return _onFilterStarted(event, emit);
    }
    if (event is WaterSupplyCodeChanged) {
      return _onConstructionCodeChanged(event, emit);
    }
  }

  Future<void> _onFilterStarted(
      FilterEvent event, Emitter<FilterState> emit) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      emit(state.copyWith(status: BaseStatusEnum.success));
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
}
