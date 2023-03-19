import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';

part 'water_supply_event.dart';
part 'water_supply_state.dart';

class WaterSupplyBloc extends Bloc<WaterSupplyEvent, WaterSupplyState> {
  WaterSupplyBloc() : super(const WaterSupplyState.initial()) {
    on<WaterSupplyEvent>(_onWaterSupplyEvent);
  }

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
    emit(state.copyWith(
      status: BaseStatusEnum.inprogress,
    ));
    try {
      emit(state.copyWith(status: BaseStatusEnum.success));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
