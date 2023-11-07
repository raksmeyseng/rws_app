part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState._(
      {this.status = BaseStatusEnum.initial,
      this.mapController,
      this.waterSupplys = const [],
      this.countWell = 0,
      this.countSmallPipe = 0,
      this.countKiosk = 0,
      this.countCommunityPond = 0,
      this.countAirToWater = 0,
      this.countPipe = 0,
      this.countRainWaterHarvesting = 0});

  final BaseStatusEnum status;
  final GoogleMapController? mapController;
  final List<WaterSupplyMapModelV2> waterSupplys;
  final int countWell;
  final int countSmallPipe;
  final int countKiosk;
  final int countCommunityPond;
  final int countRainWaterHarvesting;
  final int countPipe;
  final int countAirToWater;

  const MapState.initial() : this._();

  MapState copyWith(
      {BaseStatusEnum? status,
      GoogleMapController? mapController,
      List<WaterSupplyMapModelV2>? waterSupplys,
      int? countWell,
      int? countSmallPipe,
      int? countKiosk,
      int? countCommunityPond,
      int? countRainWaterHarvesting,
      int? countPipe,
      int? countAirToWater}) {
    return MapState._(
        status: status ?? this.status,
        mapController: mapController ?? this.mapController,
        waterSupplys: waterSupplys ?? this.waterSupplys,
        countWell: countWell ?? this.countWell,
        countSmallPipe: countSmallPipe ?? this.countSmallPipe,
        countKiosk: countKiosk ?? this.countKiosk,
        countCommunityPond: countCommunityPond ?? this.countCommunityPond,
        countRainWaterHarvesting:
            countRainWaterHarvesting ?? this.countRainWaterHarvesting,
        countPipe: countCommunityPond ?? this.countPipe,
        countAirToWater: countAirToWater ?? this.countAirToWater);
  }

  @override
  List<Object?> get props => [
        status,
        mapController,
        waterSupplys,
        countWell,
        countSmallPipe,
        countKiosk,
        countCommunityPond,
        countRainWaterHarvesting,
        countPipe,
        countAirToWater
      ];
}
