part of 'my_history_bloc.dart';

class MyHistoryState extends Equatable {
  const MyHistoryState._({
    this.status = BaseStatusEnum.initial,
  });

  final BaseStatusEnum status;

  const MyHistoryState.initial() : this._();

  MyHistoryState copyWith({
    BaseStatusEnum? status,
  }) {
    return MyHistoryState._(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
