import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/view_details/respository/list_data_detail_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';

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
    if(event is DeleteSubmited){
      return _onDeleteSubmited(event, emit);
    }
    if(event is SubmitDrafted){
      return _onSubmitDrafted(event,emit);
    }
    if(event is ProvincialHeadDepartmentApprove){
      return _onPDHApproved(event, emit);
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
        mainStatus: waterSupply.status.id,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  Future<void> _onDeleteSubmited(DeleteSubmited event,Emitter<ListDataDetailsState> emit) async {
    try{
      await Future.delayed(const Duration(milliseconds: 300));
      final response = await repository.deleteWaterSupply(state.waterSupplyId);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
      ));
      await Future.delayed(const Duration(milliseconds: 300));
      Application.router.goNamed(AppRoute.home);
      
    }catch(_){
      
    }
  }

  Future<void> _onSubmitDrafted(SubmitDrafted event,Emitter<ListDataDetailsState> emit) async{
    try{
      await Future.delayed(const Duration(milliseconds: 300));
      await repository.submitDraftedWaterSupply(state.waterSupplyId);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
      ));
      await Future.delayed(const Duration(milliseconds: 300));
      Application.router.goNamed(AppRoute.home);
    }catch(_){
      emit(state.copyWith(
        status: BaseStatusEnum.failure,
      ));
    }
  }

  Future<void> _onPDHApproved(ProvincialHeadDepartmentApprove event, Emitter<ListDataDetailsState> emit) async{
    print ('Main Status : '+ state.mainStatus.toString());
  }

}
