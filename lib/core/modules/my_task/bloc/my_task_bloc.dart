import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/my_task/model/my_task_model.dart';
import 'package:rws_app/core/modules/my_task/repositories/my_task_repository.dart';

part 'my_task_event.dart';
part 'my_task_state.dart';

class MyTaskBloc extends Bloc<MyTaskEvent, MyTaskState> {
  MyTaskBloc(this.repository) : super(const MyTaskState.initial()) {
    on<MyTaskEvent>(_onMyTaskEvent);
  }

  MyTaskRepository repository = MyTaskRepository();

  Future<void> _onMyTaskEvent(
    MyTaskEvent event,
    Emitter<MyTaskState> emit,
  ) async {
    if (event is MyTaskStarted) {
      return _onMyTaskStarted(event, emit);
    }
  }

  Future<void> _onMyTaskStarted(
    MyTaskStarted event,
    Emitter<MyTaskState> emit,
  ) async {
    final tabs = repository.getTabs(Application.context!);
    emit(state.copyWith(tabs: List.of(tabs)));
  }
}
