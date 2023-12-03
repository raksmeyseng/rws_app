part of 'filter_result_bloc.dart';

abstract class FilterResultEvent extends Equatable {
  const FilterResultEvent();

  @override
  List<Object> get props => [];
}

class FilterResultStarted extends FilterResultEvent {
  const FilterResultStarted();
}
