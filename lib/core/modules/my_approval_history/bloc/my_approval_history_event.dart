

part of 'my_approval_history_bloc.dart';

abstract class MyApprovalHistoryEvent extends Equatable{
  const MyApprovalHistoryEvent();

  @override
  List<Object> get props => [];

}


class MyApprovalHistoryStarted extends MyApprovalHistoryEvent {
  const MyApprovalHistoryStarted();
}

