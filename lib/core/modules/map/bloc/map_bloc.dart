import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';

import '../../water_supply_details/repositories/water_supply_detials_repository.dart';
import '../model/water_supply_map_model.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({required this.repository}) : super(const MapState.initial()) {
    on<MapEvent>(_onMapEvent);
  }

  final WaterSupplyDetialsRepository repository;

  Future<void> _onMapEvent(
    MapEvent event,
    Emitter<MapState> emit,
  ) async {
    if (event is MapStarted) {
      return _onMapStarted(event, emit);
    }
    if (event is MapCreated) {
      return _onMapCreated(event, emit);
    }
  }

  Future<void> _onMapStarted(
    MapStarted event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(
      status: BaseStatusEnum.inprogress,
    ));
    try {
      // final hasPermission = await PermissionHelper.requestLocationPermission();
      // if (hasPermission) {
      //   final waterSupply =
      //     await repository.getWaterSupplyMapList();
      //   emit(state.copyWith(status: BaseStatusEnum.success,waterSupplys: waterSupply));
      // }

      final waterSupply = await repository.getWaterSupplyMapList();

      final countWell = await repository.getWaterSupplyCountByType(1);
      final countSmallPipe = await repository.getWaterSupplyCountByType(2);
      final countKiosk = await repository.getWaterSupplyCountByType(3);
      final countCommunityPond = await repository.getWaterSupplyCountByType(4);
      final countRainHarvesting = await repository.getWaterSupplyCountByType(5);
      final countPipe = await repository.getWaterSupplyCountByType(6);
      final countAirToWater = await repository.getWaterSupplyCountByType(7);

      emit(state.copyWith(
          status: BaseStatusEnum.success,
          waterSupplys: waterSupply,
          countWell: countWell.count,
          countSmallPipe: countSmallPipe.count,
          countKiosk: countKiosk.count,
          countCommunityPond: countCommunityPond.count,
          countRainWaterHarvesting: countRainHarvesting.count,
          countPipe: countPipe.count,
          countAirToWater: countAirToWater.count));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  Future<void> _onMapCreated(
    MapCreated event,
    Emitter<MapState> emit,
  ) async {
    emit(state.copyWith(mapController: event.controller));
  }
}
