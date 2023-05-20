part of 'my_pending_approval_bloc.dart';


abstract class MyPendingApprovalEvent extends Equatable{
  const MyPendingApprovalEvent();

  @override
  List<Object> get props => [];

}

class MyPendingApprovalStarted extends MyPendingApprovalEvent{
  const MyPendingApprovalStarted();
}