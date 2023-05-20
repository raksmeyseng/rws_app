part of 'my_approval_history_bloc.dart';

class MyApprovalHistoryState extends Equatable {
  const MyApprovalHistoryState._({
    this.status=BaseStatusEnum.initial,
    this.myApprovalHistory = const [],
  });

  final BaseStatusEnum status;
  final List<MyApprovalHistoryModel> myApprovalHistory;

  const MyApprovalHistoryState.initial() : this._();

  MyApprovalHistoryState copyWith({BaseStatusEnum? status,
   List<MyApprovalHistoryModel>? myApprovalHistory}){
    return MyApprovalHistoryState._(
      status: status??this.status,
      myApprovalHistory: myApprovalHistory??this.myApprovalHistory
    );
  }

  @override
  List<Object?> get props => [status,myApprovalHistory];
  
}
