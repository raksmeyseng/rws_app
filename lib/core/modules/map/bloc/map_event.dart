part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapCreated extends MapEvent {
  final GoogleMapController controller;

  const MapCreated(this.controller);

  @override
  List<Object> get props => [controller];
}

class MapStarted extends MapEvent {
  const MapStarted();
}
