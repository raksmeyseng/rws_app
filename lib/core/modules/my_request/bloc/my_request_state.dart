part of 'my_request_bloc.dart';

class MyRequestState extends Equatable {
  const MyRequestState._({
    this.status = BaseStatusEnum.initial,
    this.myRequest=const [],
  });

  final BaseStatusEnum status;
  final List<MyRequestModel> myRequest;

  const MyRequestState.initial() : this._();

  MyRequestState copyWith({BaseStatusEnum? status,
    List<MyRequestModel>? myRequest}) {
    return MyRequestState._(
      status: status ?? this.status,
      myRequest: myRequest ?? this.myRequest,
    );
  }

  @override
  List<Object?> get props => [status,myRequest];
}
