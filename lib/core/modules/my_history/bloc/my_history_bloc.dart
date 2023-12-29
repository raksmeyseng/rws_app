import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/authentication/repositories/auth_repository.dart';
import 'package:rws_app/core/modules/my_history/models/my_request_history_model.dart';
import 'package:rws_app/core/modules/my_history/repositories/my_history_repository.dart';

import '../../../../config/routes/application.dart';

part 'my_history_event.dart';
part 'my_history_state.dart';

class MyHistoryBloc extends Bloc<MyHistoryEvent, MyHistoryState> {
  MyHistoryBloc() : super(const MyHistoryState.initial()) {
    on<MyHistoryEvent>(_onMyHistoryEvent);
  }

  AuthRepository authRespository = AuthRepository();
  MyHistoryRepository respository = MyHistoryRepository();

  Future<void> _onMyHistoryEvent(
    MyHistoryEvent event,
    Emitter<MyHistoryState> emit,
  ) async {
    if (event is MyHistoryStarted) {
      return _onMyHistoryStarted(event, emit);
    }
  }

  Future<void> _onMyHistoryStarted(
      MyHistoryStarted event, Emitter<MyHistoryState> emit) async {
    try {
      emit(state.copyWith(status: BaseStatusEnum.inprogress));
      final userId = Application.authBloc.state.userToken?.user.id;
      final myHistory = await respository.getMyHistoryList(userId ?? 0);
      print(myHistory);
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        myhistory: myHistory,
      ));
    } catch (_) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
