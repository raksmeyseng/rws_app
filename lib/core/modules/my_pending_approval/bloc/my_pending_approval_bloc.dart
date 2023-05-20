import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/modules/my_pending_approval/repositories/my_pending_approval_repository.dart';

import '../../../../config/routes/application.dart';
import '../../water_supply_details/model/water_supply_model.dart';


part 'my_pending_approval_event.dart';
part 'my_pending_approval_state.dart';

class MyPendingApprovalBloc extends Bloc<MyPendingApprovalEvent, MyPendingApprovalState>{

  MyPendingApprovalRepository repository=MyPendingApprovalRepository();
  AuthRepository authRepo=AuthRepository();

  MyPendingApprovalBloc():super(const MyPendingApprovalState.initial()){
    on<MyPendingApprovalEvent>(_onMyPendingApprovalEvent);
  }

  Future<void> _onMyPendingApprovalEvent(MyPendingApprovalEvent event,
  Emitter<MyPendingApprovalState> emit) async{
    if(event is MyPendingApprovalStarted){
      return _onMyPendingApprovalStarted(event, emit);
    }
  }

  Future<void> _onMyPendingApprovalStarted(MyPendingApprovalStarted event,Emitter<MyPendingApprovalState> emit) async{
    try{
      emit(state.copyWith(status:BaseStatusEnum.inprogress));

      final userId = Application.authBloc.state.userToken?.user.id;
      final isProvincialHead = Application.authBloc.state.userToken?.user.isProvincialDepartmentHead??false;
      final isDataVerifier1=Application.authBloc.state.userToken?.user.isDataVerifier1??false;
      final isDataVerifier2=Application.authBloc.state.userToken?.user.isDataVerifier2??false;
      final isDepartmentHead=Application.authBloc.state.userToken?.user.isHeadDepartment??false;

      List<WaterSupplyModel> myPendingApproval=[];
      if(isProvincialHead)
      {
        final provincialDepartmentHeadProvinceId=Application.authBloc.state.userToken?.user.provincialDepartmentHeadProvinceId??0;
        myPendingApproval = await repository.getMyPendingApprovalListProvincialHead(provincialDepartmentHeadProvinceId);
      }
      else if(isDataVerifier1){
        myPendingApproval=await repository.getMyPendingApprovalListVerify1();
      }else if (isDataVerifier2){
        myPendingApproval=await repository.getMyPendingApprovalListVerifier2();

      }else if (isDepartmentHead){
        myPendingApproval=await repository.getMyPendingApprovalListDepartmentHead();
        
      }
      else{
        myPendingApproval =  await repository.getMyPendingApprovalList(userId??0);
      }
      

      emit(state.copyWith(status:BaseStatusEnum.success,
      myPendingApproval:myPendingApproval
      ));
    }catch(_){
      emit(state.copyWith(status:BaseStatusEnum.failure));
    }
  }

}