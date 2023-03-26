part of 'my_task_bloc.dart';

class MyTaskState extends Equatable {
  const MyTaskState._({
    this.status = BaseStatusEnum.initial,
    this.tabs = const [],
  });

  final BaseStatusEnum status;
  final List<MyTaskModel> tabs;

  const MyTaskState.initial() : this._();

  MyTaskState copyWith({
    BaseStatusEnum? status,
    List<MyTaskModel>? tabs,
  }) {
    return MyTaskState._(
      status: status ?? this.status,
      tabs: tabs ?? this.tabs,
    );
  }

  @override
  List<Object?> get props => [status, tabs];
}
