import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/water_supply/model/water_supply_model.dart';
import 'package:rws_app/core/modules/water_supply/repositories/water_supply_repository.dart';

part 'water_supply_event.dart';
part 'water_supply_state.dart';

class WaterSupplyBloc extends Bloc<WaterSupplyEvent, WaterSupplyState> {
  WaterSupplyBloc(this.repository) : super(const WaterSupplyState.initial()) {
    on<WaterSupplyEvent>(_onWaterSupplyEvent);
  }

  final WaterSupplyRepository repository;

  Future<void> _onWaterSupplyEvent(
    WaterSupplyEvent event,
    Emitter<WaterSupplyState> emit,
  ) async {
    if (event is WaterSupplyStarted) {
      return _onWaterSupplyStarted(event, emit);
    }
  }

  Future<void> _onWaterSupplyStarted(
    WaterSupplyStarted event,
    Emitter<WaterSupplyState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      final waterSupply = await repository.getWaterSupplyList();
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        waterSupply: waterSupply,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
