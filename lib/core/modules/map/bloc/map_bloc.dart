import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/utils/helpers/permission_helper.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(const MapState.initial()) {
    on<MapEvent>(_onMapEvent);
  }

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
      final hasPermission = await PermissionHelper.requestLocationPermission();
      if (hasPermission) {
        emit(state.copyWith(status: BaseStatusEnum.success));
      }
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
