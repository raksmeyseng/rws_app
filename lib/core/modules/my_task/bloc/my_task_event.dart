part of 'my_task_bloc.dart';

abstract class MyTaskEvent extends Equatable {
  const MyTaskEvent();

  @override
  List<Object> get props => [];
}

class MyTaskStarted extends MyTaskEvent {
  const MyTaskStarted();
}
