part of 'my_history_bloc.dart';

abstract class MyHistoryEvent extends Equatable {
  const MyHistoryEvent();

  @override
  List<Object> get props => [];
}

class MyHistoryStarted extends MyHistoryEvent {
  const MyHistoryStarted();
}
