import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/dashboard/enum/main_menu_enum.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState.initial()) {
    on<DashboardEvent>(_onDashboardEvent, transformer: sequential());
  }

  Future<void> _onDashboardEvent(
    DashboardEvent event,
    Emitter<DashboardState> emit,
  ) async {
    if (event is DashboardStarted) {
      return _onDashboardStarted(event, emit);
    }
    if (event is SelectedMenuChanged) {
      return _onSelectedMenuChanged(event, emit);
    }
  }

  Future<void> _onDashboardStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      emit(state.copyWith(status: BaseStatusEnum.success));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  void _onSelectedMenuChanged(
    SelectedMenuChanged event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(
      selectedMenu: event.selectedMenu,
    ));
  }
}
