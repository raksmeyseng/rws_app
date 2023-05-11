import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/view_details/respository/list_data_detail_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';

part 'list_data_detials_event.dart';
part 'list_data_detials_state.dart';

class ListDataDetailsBloc
    extends Bloc<ListDataDetailsEvent, ListDataDetailsState> {
  ListDataDetailsBloc({
    required this.repository,
    required int waterSupplyId,
  }) : super(ListDataDetailsState.initial(waterSupplyId: waterSupplyId)) {
    on<ListDataDetailsEvent>(_onListDataDetailsEvent);
  }

  final ListDataDetailRepository repository;

  Future<void> _onListDataDetailsEvent(
    ListDataDetailsEvent event,
    Emitter<ListDataDetailsState> emit,
  ) async {
    if (event is ListDataStarted) {
      return _onListDataDetailsStarted(event, emit);
    }
  }

  Future<void> _onListDataDetailsStarted(
    ListDataStarted event,
    Emitter<ListDataDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      final waterSupply =
          await repository.getWaterSupplyViewDetail(state.waterSupplyId);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        waterSupply: waterSupply,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
