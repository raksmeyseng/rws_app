part of 'my_draft_bloc.dart';

abstract class MyDraftEvent extends Equatable {
  const MyDraftEvent();

  @override
  List<Object> get props => [];
}

class MyDraftStarted extends MyDraftEvent {
  const MyDraftStarted();
}
