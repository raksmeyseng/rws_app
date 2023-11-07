part of 'my_history_bloc.dart';

class MyHistoryState extends Equatable {
  const MyHistoryState._({
    this.status = BaseStatusEnum.initial,
    this.myhistory = const [],
  });

  final BaseStatusEnum status;
  final List<MyReqeustHistoryModel> myhistory;

  const MyHistoryState.initial() : this._();

  MyHistoryState copyWith({
    BaseStatusEnum? status,
    List<MyReqeustHistoryModel>? myhistory,
  }) {
    return MyHistoryState._(
      status: status ?? this.status,
      myhistory: myhistory ?? this.myhistory,
    );
  }

  @override
  List<Object?> get props => [status, myhistory];
}
