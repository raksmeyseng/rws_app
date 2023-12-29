import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rws_app/core/animation/my_animated_switcher.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/map/bloc/map_bloc.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:rws_app/utils/lifecycle_event_handler.dart';

import '../model/water_supply_map_model.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  Completer<GoogleMapController> completer = Completer();
  late GoogleMapController newGoogleMapController;
  late final LifecycleEventHandler _lifeCycleObserver;
  final CameraPosition position = const CameraPosition(
    target: LatLng(11.5564, 104.9282),
    zoom: 0,
  );
  Set<Marker> markers = <Marker>{};
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor smallPipeIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor kioskIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor communityPondIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor airToWaterIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor pipeIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor waterRainIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
    if (!kIsWeb) {
      _lifeCycleObserver = LifecycleEventHandler(
        onResumed: () async {
          await goToCurrentUserLocation_1();
          // final granted = await Permission.location.isGranted;
          // if (granted) {
          //   await goToCurrentUserLocation();
          // }
        },
      );
      WidgetsBinding.instance.addObserver(_lifeCycleObserver);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) =>
          previous.waterSupplys != current.waterSupplys,
      builder: (context, state) {
        return MyAnimatedSwitcher(
          child: _buildChild(
              state.status,
              state.waterSupplys,
              state.countWell,
              state.countSmallPipe,
              state.countKiosk,
              state.countCommunityPond,
              state.countRainWaterHarvesting,
              state.countPipe,
              state.countAirToWater),
        );
      },
    );
  }

  Widget _buildChild(
      BaseStatusEnum status,
      List<WaterSupplyMapModelV2> waterSupplys,
      int countWell,
      int countSmallPipe,
      int countKiosk,
      int countCommunityPond,
      int countRainHavesting,
      int countPipe,
      int countAirToWater) {
    switch (status) {
      case BaseStatusEnum.success:
        // ignore: prefer_collection_literals
        // LatLongConverter converter = LatLongConverter();
        for (var ws in waterSupplys) {
          switch (ws.waterSupplyTypeId) {
            case 1:
              markerIcon = markerIcon;
              break;
            case 2:
              markerIcon = smallPipeIcon;
              break;
            case 3:
              markerIcon = kioskIcon;
              break;
            case 4:
              markerIcon = communityPondIcon;
              break;
            case 5:
              markerIcon = waterRainIcon;
              break;
            case 6:
              markerIcon = pipeIcon;
              break;
            case 7:
              markerIcon = airToWaterIcon;
              break;
          }

          var marker = Marker(
            //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
            markerId: MarkerId(ws.waterSupplyCode),
            position: LatLng(double.parse(ws.decimalDegreeLat),
                double.parse(ws.decimalDegreeLng)),
            infoWindow: InfoWindow(
              title: ws.waterSupplyCode,
              snippet: ws.waterSupplyCode,
            ),
            //icon: BitmapDescriptor.fromBytes(customMarker)
            icon: markerIcon,
          );

          markers.add(marker);

          // if(ws.mapUnitId==1){
          //   var marker = Marker(
          //           //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
          //         markerId: MarkerId(ws.address.nameEn),
          //         position: LatLng(ws.lat, ws.lng),
          //         infoWindow: InfoWindow(
          //           title: ws.waterSupplyCode,
          //                 snippet: ws.waterSupplyType,
          //               ),
          //               //icon: BitmapDescriptor.fromBytes(customMarker)
          //               icon: markerIcon,
          //       );
          //       markers.add(marker);
          //   // try{
          //   //   var utmX=double.parse(ws.utmX);
          //   //   var utmY=double.parse(ws.utmY);
          //   //   if(utmX>0 && utmY>0){
          //   //     LatLong result = converter.getLatLongFromOSGB(utmX.toInt(),utmY.toInt());//,Datums.WGS84
          //   //     var lng = double.parse(result.long).abs();
          //   //     print(result.lat+ ' '+lng);
          //   //     var marker = Marker(
          //   //         //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
          //   //       markerId: MarkerId(ws.address.nameEn),
          //   //       position: LatLng(double.parse(result.lat), lng),
          //   //       infoWindow: InfoWindow(
          //   //         title: ws.waterSupplyCode,
          //   //               snippet: ws.waterSupplyType,
          //   //             ),
          //   //             //icon: BitmapDescriptor.fromBytes(customMarker)
          //   //             icon: markerIcon,
          //   //     );
          //   //     markers.add(marker);
          //   //   }
          //   // }catch(_){
          //   // }
          //   //print("${result.lat} ${result.long}");
          // }else if(ws.mapUnitId==2){
          //   var marker = Marker(
          //           //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
          //     markerId: MarkerId(ws.waterSupplyCode),
          //     position: LatLng(double.parse(ws.decimalDegreeLat), double.parse(ws.decimalDegreeLng)),
          //           infoWindow: InfoWindow(
          //             title: ws.waterSupplyCode,
          //             snippet: ws.waterSupplyCode,
          //           ),
          //           //icon: BitmapDescriptor.fromBytes(customMarker)
          //           icon: markerIcon,
          //   );
          // markers.add(marker);
          // }
        }
        // return GoogleMap(
        //   mapType: MapType.normal,
        //   myLocationButtonEnabled: true,
        //   myLocationEnabled: true,
        //   initialCameraPosition: position,
        //   onMapCreated: (controller) {
        //     completer.complete(controller);
        //     newGoogleMapController = controller;
        //     //goToCurrentUserLocation();
        //     goToCurrentUserLocation_1();
        //   },
        //   markers: markers,
        // );

        return Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: position,
              onMapCreated: (controller) {
                completer.complete(controller);
                newGoogleMapController = controller;
                //goToCurrentUserLocation();
                goToCurrentUserLocation_1();
              },
              markers: markers,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  //Well
                  Image.asset(
                    'assets/icons/orange-dot.png',
                    width: 15,
                    height: 15,
                  ),
                  Text('WS : ${countWell.toString()}',
                      style: const TextStyle(fontSize: 9)),
                  //SmallPipe
                  Image.asset(
                    'assets/icons/yellow-dot.png',
                    width: 15,
                    height: 15,
                  ),
                  Text('SP : ${countSmallPipe.toString()}',
                      style: const TextStyle(fontSize: 9)),
                  //Kiosk
                  Image.asset(
                    'assets/icons/green-dot.png',
                    width: 15,
                    height: 15,
                  ),
                  Text('WK : ${countKiosk.toString()}',
                      style: const TextStyle(fontSize: 9)),
                  //Community Pond
                  Image.asset(
                    'assets/icons/red-dot.png',
                    width: 15,
                    height: 15,
                  ),
                  Text('CP : ${countCommunityPond.toString()}',
                      style: const TextStyle(fontSize: 9)),
                  //Rain Water
                  Image.asset(
                    'assets/icons/purple-dot.png',
                    width: 15,
                    height: 15,
                  ),
                  Text('RW : ${countRainHavesting.toString()}',
                      style: const TextStyle(fontSize: 9)),
                  //Pipe
                  Image.asset(
                    'assets/icons/pink-dot.png',
                    width: 15,
                    height: 15,
                  ),
                  Text('PW : ${countPipe.toString()}',
                      style: const TextStyle(fontSize: 9)),
                  //Air to Water
                  Image.asset(
                    'assets/icons/ltblue-dot.png',
                    width: 15,
                    height: 15,
                  ),
                  Text('AW : ${countAirToWater.toString()}',
                      style: const TextStyle(fontSize: 9)),

                  // Flexible(
                  //   child: Text(
                  //       'WS : ${countWell.toString()}| SP: ${countSmallPipe.toString()} | WK: ${countKiosk.toString()} | CP : ${countCommunityPond.toString()} | RW : ${countRainHavesting.toString()} | PW : ${countPipe.toString()} | AW: ${countAirToWater.toString()}'),
                  // )
                ],
              ),
            ),
            //Text('អណ្ដូង :  ${countWell.toString()} |'),
          ],
        );

      case BaseStatusEnum.failure:
        return const _FailureView();
      default:
        return const _LoadingView();
    }
  }

  Future<void> goToCurrentUserLocation({double zoom = 7}) async {
    try {
      final GoogleMapController controller = await completer.future;
      final pos = await getCurrentPosition();
      if (pos != null) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              //target: LatLng(pos.latitude, pos.longitude),
              target: const LatLng(11.562108, 104.888535),
              zoom: zoom,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> goToCurrentUserLocation_1({double zoom = 7}) async {
    try {
      final GoogleMapController controller = await completer.future;

      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            //target: LatLng(pos.latitude, pos.longitude),
            target: const LatLng(11.562108, 104.888535),
            zoom: zoom,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  loadMarker(WaterSupplyMapModel ws) async {
    final Uint8List customMarker = await getBytesFromAsset(
        'http://maps.google.com/mapfiles/ms/icons/orange-dot.png', 50);

    var marker = Marker(
        //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
        markerId: MarkerId(ws.address.nameEn),
        position: LatLng(double.parse(ws.decimalDegreeLat),
            double.parse(ws.decimalDegreeLng)),
        infoWindow: InfoWindow(
          title: ws.waterSupplyCode,
          snippet: ws.waterSupplyType,
        ),
        icon: BitmapDescriptor.fromBytes(customMarker));
    markers.add(marker);
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/icons/orange-dot.png')
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/icons/yellow-dot.png')
        .then(
      (icon) {
        setState(() {
          smallPipeIcon = icon;
        });
      },
    );

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/icons/green-dot.png')
        .then(
      (icon) {
        setState(() {
          kioskIcon = icon;
        });
      },
    );

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/icons/red-dot.png')
        .then(
      (icon) {
        setState(() {
          communityPondIcon = icon;
        });
      },
    );

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/icons/purple-dot.png')
        .then(
      (icon) {
        setState(() {
          waterRainIcon = icon;
        });
      },
    );

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/icons/pink-dot.png')
        .then(
      (icon) {
        setState(() {
          pipeIcon = icon;
        });
      },
    );

    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/icons/ltblue-dot.png')
        .then(
      (icon) {
        setState(() {
          airToWaterIcon = icon;
        });
      },
    );
  }
// ====

  @override
  void dispose() {
    if (!kIsWeb) {
      WidgetsBinding.instance.removeObserver(_lifeCycleObserver);
    }
    super.dispose();
  }
}

// Loading View
// =================
class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

// =================
// Failure View
// =================
class _FailureView extends StatelessWidget {
  const _FailureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadDataFailed();
  }
}
