part of 'my_request_bloc.dart';

abstract class MyRequestEvent extends Equatable{
  const MyRequestEvent();

  @override
  List<Object> get props => [];

}

class MyRequestStarted extends MyRequestEvent{
  const MyRequestStarted();
}