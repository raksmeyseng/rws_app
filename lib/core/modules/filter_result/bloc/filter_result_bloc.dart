import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/filter_result/repositories/filter_result_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_list_model.dart';

part 'filter_result_event.dart';
part 'filter_result_state.dart';

class FilterResultBloc extends Bloc<FilterResultEvent, FilterResultState> {
  FilterResultBloc(
      {required int waterSupplyTypeId,
      required String waterSupplyCode,
      required String provinceId,
      required String districtId,
      required String communeId,
      required String villageId,
      required this.repository})
      : super(FilterResultState.initial(
            waterSupplyTypeId: waterSupplyTypeId,
            waterSupplyCode: waterSupplyCode,
            provinceId: provinceId,
            districtId: districtId,
            communeId: communeId,
            villageId: villageId)) {
    on<FilterResultEvent>(_onFilterResultEvent);
  }

  final FilterResultRepository repository;

  Future<void> _onFilterResultEvent(
      FilterResultEvent event, Emitter<FilterResultState> emit) async {
    if (event is FilterResultStarted) {
      return _onFilterResultStarted(event, emit);
    }
  }

  Future<void> _onFilterResultStarted(
      FilterResultEvent event, Emitter<FilterResultState> emit) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      //emit(state.copyWith(status: BaseStatusEnum.success));
      final waterSupply = await repository.getWaterSupplyFilterResultList(
          state.provinceId, state.districtId, state.communeId, state.villageId);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        waterSupply: waterSupply,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
