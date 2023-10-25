part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState._({
    this.status = BaseStatusEnum.initial,
    this.mapController,
    this.waterSupplys=const [],
  });

  final BaseStatusEnum status;
  final GoogleMapController? mapController;
  final List<WaterSupplyMapModelV2> waterSupplys;

  const MapState.initial() : this._();

  MapState copyWith({
    BaseStatusEnum? status,
    GoogleMapController? mapController,
    List<WaterSupplyMapModelV2>? waterSupplys,
  }) {
    return MapState._(
      status: status ?? this.status,
      mapController: mapController ?? this.mapController,
      waterSupplys: waterSupplys??this.waterSupplys,
    );
  }

  @override
  List<Object?> get props => [
    status, 
    mapController, 
    waterSupplys];
}
