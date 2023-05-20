import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/modules/my_approval_history/repositories/my_approval_history_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';

import '../../../../config/routes/application.dart';
import '../models/my_approval_history_model.dart';

part 'my_approval_history_event.dart';
part 'my_approval_history_state.dart';

class MyApprovalHistoryBloc extends Bloc<MyApprovalHistoryEvent, MyApprovalHistoryState> {
  
  MyApprovalHistoryBloc() : super(const MyApprovalHistoryState.initial()){
    on<MyApprovalHistoryEvent>(_onMyApprovalHistoryEvent);
  }

  MyApprovalHistoryRepository repository=MyApprovalHistoryRepository();
  AuthRepository authRepo=AuthRepository();

  Future<void> _onMyApprovalHistoryEvent(MyApprovalHistoryEvent event,
  Emitter<MyApprovalHistoryState> emit) async{
    if (event is MyApprovalHistoryStarted){
      return _onMyApprovalHistoryStarted(event, emit);
    }
  }

  Future<void> _onMyApprovalHistoryStarted(MyApprovalHistoryStarted event,Emitter<MyApprovalHistoryState> emit) async{
    try{
      emit(state.copyWith(status: BaseStatusEnum.inprogress));

      final userId = Application.authBloc.state.userToken?.user.id;
      print(userId);

      final myhistory = await repository.getMyApprovalHistoryList(userId??0);

      emit(state.copyWith(
        status: BaseStatusEnum.success,
        myApprovalHistory: myhistory,
      ));
    }catch(_){
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

}
