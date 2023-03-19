part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState._({
    this.status = BaseStatusEnum.initial,
    this.mapController,
  });

  final BaseStatusEnum status;
  final GoogleMapController? mapController;

  const MapState.initial() : this._();

  MapState copyWith({
    BaseStatusEnum? status,
    GoogleMapController? mapController,
  }) {
    return MapState._(
      status: status ?? this.status,
      mapController: mapController ?? this.mapController,
    );
  }

  @override
  List<Object?> get props => [status, mapController];
}
