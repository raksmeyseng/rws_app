import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/modules/my_request/model/my_request_model.dart';
import 'package:rws_app/core/modules/my_request/repositories/my_request_repository.dart';

part 'my_request_event.dart';
part 'my_request_state.dart';

class MyRequestBloc extends Bloc<MyRequestEvent, MyRequestState> {
  MyRequestBloc() : super(const MyRequestState.initial()) {
    on<MyRequestEvent>(_onMyRequestEvent);
  }

  AuthRepository authRespository=AuthRepository();
  MyRequestRepository repository=MyRequestRepository();

  Future<void> _onMyRequestEvent(MyRequestEvent event,
    Emitter<MyRequestState> emit) async {
    if (event is MyRequestStarted) {
      return _onMyRequestStarted(event, emit);
    }
  }

  Future<void> _onMyRequestStarted(MyRequestStarted event,Emitter<MyRequestState> emit) async{
    try{
      emit(state.copyWith(status:BaseStatusEnum.inprogress));

      final isDataProvincialHeadDepartmentId = Application.authBloc.state.userToken?.user.id;
      final myrequest = await repository.getMyRequestList(isDataProvincialHeadDepartmentId??0);

      emit(state.copyWith(
          status:BaseStatusEnum.success,
          myRequest: myrequest
      ));
    }catch(_){
      emit(state.copyWith(status:BaseStatusEnum.failure));
    }
  }
}
