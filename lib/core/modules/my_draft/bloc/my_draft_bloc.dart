import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/my_draft/repositories/my_draft_repository.dart';
import 'package:rws_app/utils/event/event_type.dart';

import '../../authentication/repositories/auth_repository.dart';
import '../../water_supply_details/model/water_supply_model.dart';

part 'my_draft_event.dart';
part 'my_draft_state.dart';

class MyDraftBloc extends Bloc<MyDraftEvent, MyDraftState> {
  MyDraftBloc(this.repository) : super(const MyDraftState.initial()) {
    on<MyDraftEvent>(_onMyDraftEvent);

    _waterSupplyUpdatedSub =
        Application.eventBus.on<WaterSupplyUpdated>().listen((event) {
      add(const MyDraftStarted());
    });
  }

  MyDraftRepository repository = MyDraftRepository();
  AuthRepository authRepository = AuthRepository();

  StreamSubscription<WaterSupplyUpdated>? _waterSupplyUpdatedSub;

  Future<void> _onMyDraftEvent(
    MyDraftEvent event,
    Emitter<MyDraftState> emit,
  ) async {
    if (event is MyDraftStarted) {
      return _onMyDraftStarted(event, emit);
    }
  }

  Future<void> _onMyDraftStarted(
    MyDraftStarted event,
    Emitter<MyDraftState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BaseStatusEnum.inprogress));

      final userId = Application.authBloc.state.userToken?.user.id;
      print(userId);

      final mydraft = await repository.getMyDraftList(userId ?? 0);

      emit(state.copyWith(
        status: BaseStatusEnum.success,
        mydraft: mydraft,
      ));
    } catch (_) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  @override
  Future<void> close() {
    _waterSupplyUpdatedSub?.cancel();
    return super.close();
  }
}
