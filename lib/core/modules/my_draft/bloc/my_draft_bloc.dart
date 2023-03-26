import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/my_draft/repositories/my_draft_repository.dart';

part 'my_draft_event.dart';
part 'my_draft_state.dart';

class MyDraftBloc extends Bloc<MyDraftEvent, MyDraftState> {
  MyDraftBloc(this.repository) : super(const MyDraftState.initial()) {
    on<MyDraftEvent>(_onMyDraftEvent);
  }

  MyDraftRepository repository = MyDraftRepository();

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
      final mydraft = await repository.getMyDraftList();
      emit(state.copyWith(
        status: BaseStatusEnum.success,
        mydraft: mydraft,
      ));
    } catch (_) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
