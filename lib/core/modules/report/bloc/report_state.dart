part of 'report_bloc.dart';

class ReportState extends Equatable {
  const ReportState._({
    this.status=BaseStatusEnum.initial,
  });

  final BaseStatusEnum status;

  const ReportState.initial():this._();

  ReportState copyWith({
    BaseStatusEnum? status
  }){
    return ReportState._(
      status:status??this.status,
      );
  }
  
  @override
  List<Object?> get props => [status];
}

// class ReportInitial extends ReportState {}
