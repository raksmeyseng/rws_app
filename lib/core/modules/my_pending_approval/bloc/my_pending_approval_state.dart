part of 'my_pending_approval_bloc.dart';

class MyPendingApprovalState extends Equatable{

  const MyPendingApprovalState._({
    this.status=BaseStatusEnum.initial,
    this.myPendingApproval = const [],
  });

  final BaseStatusEnum status;
  final List<WaterSupplyModel> myPendingApproval;

  const MyPendingApprovalState.initial():this._();

  MyPendingApprovalState copyWith({BaseStatusEnum? status,
  List<WaterSupplyModel>? myPendingApproval}){
    return MyPendingApprovalState._(
      status: status??this.status,
      myPendingApproval: myPendingApproval??this.myPendingApproval
    );
  }

  @override
  List<Object?> get props => [status,myPendingApproval];
}