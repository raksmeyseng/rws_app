part of 'list_data_details_bloc.dart';

abstract class ListDataDetailsEvent extends Equatable {
  const ListDataDetailsEvent();

  @override
  List<Object> get props => [];
}

class ListDataStarted extends ListDataDetailsEvent {
  const ListDataStarted();
}
