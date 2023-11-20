import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/dashboard/enum/main_menu_enum.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required int index})
      : super(DashboardState.initial(index: index)) {
    on<DashboardEvent>(_onDashboardEvent);
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
    if (event is TabTapped) {
      return _onTabTapped(event, emit);
    }
  }

  Future<void> _onDashboardStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        currentIndex: state.currentIndex,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  void _onTabTapped(
    TabTapped event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onSelectedMenuChanged(
    SelectedMenuChanged event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(selectedMenu: event.selectedMenu));
  }
}
