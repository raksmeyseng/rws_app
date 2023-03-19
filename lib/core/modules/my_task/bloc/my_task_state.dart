part of 'my_task_bloc.dart';

abstract class MyTaskState extends Equatable {
  const MyTaskState();
  
  @override
  List<Object> get props => [];
}

class MyTaskInitial extends MyTaskState {}
