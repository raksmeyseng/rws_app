import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_task_event.dart';
part 'my_task_state.dart';

class MyTaskBloc extends Bloc<MyTaskEvent, MyTaskState> {
  MyTaskBloc() : super(MyTaskInitial()) {
    on<MyTaskEvent>((event, emit) {
    });
  }
}
