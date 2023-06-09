part of 'my_draft_bloc.dart';

class MyDraftState extends Equatable {
  const MyDraftState._({
    this.status = BaseStatusEnum.initial,
    this.mydraft = const [],
  });

  final BaseStatusEnum status;
  final List<WaterSupplyModel> mydraft;

  const MyDraftState.initial() : this._();

  MyDraftState copyWith({
    BaseStatusEnum? status,
    List<WaterSupplyModel>? mydraft,
  }) {
    return MyDraftState._(
      status: status ?? this.status,
      mydraft: mydraft ?? this.mydraft,
    );
  }

  @override
  List<Object?> get props => [status, mydraft];
}
