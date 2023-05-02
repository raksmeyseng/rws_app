import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/modules/water_supply_details/repositories/water_supply_detials_repository.dart';

part 'water_supply_detials_event.dart';
part 'water_supply_detials_state.dart';

class WaterSupplyDetialsBloc
    extends Bloc<WaterSupplyDetialsEvent, WaterSupplyDetialsState> {
  WaterSupplyDetialsBloc({
    required this.repository,
    required int waterSupplyId,
  }) : super(WaterSupplyDetialsState.initial(waterSupplyId: waterSupplyId)) {
    on<WaterSupplyDetialsEvent>(_onWaterSupplyEvent);
  }

  final WaterSupplyDetialsRepository repository;

  Future<void> _onWaterSupplyEvent(
    WaterSupplyDetialsEvent event,
    Emitter<WaterSupplyDetialsState> emit,
  ) async {
    if (event is WaterSupplyStarted) {
      return _onWaterSupplyStarted(event, emit);
    }
  }

  Future<void> _onWaterSupplyStarted(
    WaterSupplyStarted event,
    Emitter<WaterSupplyDetialsState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      print(state.waterSupplyId);
      final waterSupply =
          await repository.getWaterSupplyListv2(state.waterSupplyId);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        waterSupply: waterSupply,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
