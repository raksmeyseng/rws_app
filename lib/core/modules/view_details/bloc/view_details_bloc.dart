import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';

//import 'package:rws_app/core/modules/water_supply/bloc/water_supply_bloc.dart';
import 'package:rws_app/core/modules/water_supply/model/water_supply_model.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';

import '../respository/list_data_detail_repository.dart';
part 'view_details_event.dart';
part 'view_details_state.dart';

class WaterSupplyViewDetailBloc extends Bloc<WaterSupplyViewDetailEvent,WaterSupplyViewDetailState>{
  WaterSupplyViewDetailBloc({
    required this.repository,
    required int waterSupplyId,
}):super(WaterSupplyViewDetailState.initial(id: waterSupplyId)){
    on<WaterSupplyViewDetailEvent>(_onWaterSupplyViewDetailEvent);
  }

  final ListDataDetailRepository repository;

  Future<void> _onWaterSupplyViewDetailEvent(WaterSupplyViewDetailEvent event,
      Emitter<WaterSupplyViewDetailState> emit)async{
    if(event is WaterSupplyViewDetailStarted){
      return _onWaterSupplyViewDetailStarted(event,emit);
    }
  }

  Future<void> _onWaterSupplyViewDetailStarted(
      WaterSupplyViewDetailStarted event,
      Emitter<WaterSupplyViewDetailState> emit,
      ) async{
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try{
      print(state.waterSupplyId);
      final waterSupply=await repository.getWaterSupplyViewDetail(state.waterSupplyId);
      emit(state.copyWith(status: BaseStatusEnum.success,
          waterSupply:waterSupply));
    }catch(e){
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

}

