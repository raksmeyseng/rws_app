import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rws_app/core/animation/my_animated_switcher.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/map/bloc/map_bloc.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:rws_app/utils/lifecycle_event_handler.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;
import 'dart:typed_data';

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
  Set<Marker> markers= Set<Marker>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  // Set<Marker> markers = <Marker>{
  //   const Marker(
  //     markerId: MarkerId('Phnom Penh'),
  //     position: LatLng(11.547740, 104.884858),
  //     infoWindow: InfoWindow(
  //       title: 'Phnom Penh',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកឯកជន',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Banteay Meanchey'),
  //     position: LatLng(13.695997, 102.566830),
  //     infoWindow: InfoWindow(
  //       title: 'Banteay Meanchey',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Battambang'),
  //     position: LatLng(13.101166, 105.025252),
  //     infoWindow: InfoWindow(
  //       title: 'Battambang',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Kampong Cham'),
  //     position: LatLng(12.013056, 105.441817),
  //     infoWindow: InfoWindow(
  //       title: 'Kampong Cham',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Kampong Chhnang'),
  //     position: LatLng(12.249794, 104.666290),
  //     infoWindow: InfoWindow(
  //       title: 'Kampong Chhnang',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Kampong Speu'),
  //     position: LatLng(11.520035, 104.378320),
  //     infoWindow: InfoWindow(
  //       title: 'Kampong Speu',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Kampong Thom'),
  //     position: LatLng(12.711749, 104.888535),
  //     infoWindow: InfoWindow(
  //       title: 'Kampong Thom',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Kampot'),
  //     position: LatLng(10.615895, 104.174970),
  //     infoWindow: InfoWindow(
  //       title: 'Kampot',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Kandal'),
  //     position: LatLng(11.337621, 105.031104),
  //     infoWindow: InfoWindow(
  //       title: 'Kandal',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Kep'),
  //     position: LatLng(10.482623, 104.295952),
  //     infoWindow: InfoWindow(
  //       title: 'Kep',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Koh Kong'),
  //     position: LatLng(11.612069, 102.986710),
  //     infoWindow: InfoWindow(
  //       title: 'Koh Kong',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Kratié'),
  //     position: LatLng(12.483902, 106.019973),
  //     infoWindow: InfoWindow(
  //       title: 'Kratié',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  //   const Marker(
  //     markerId: MarkerId('Mondulkiri'),
  //     position: LatLng(12.429527, 107.194866),
  //     infoWindow: InfoWindow(
  //       title: 'Mondulkiri',
  //       snippet: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
  //     ),
  //   ),
  // };

  @override
  void initState() {
    addCustomIcon();
    super.initState();
    if (!kIsWeb) {
      _lifeCycleObserver = LifecycleEventHandler(
        onResumed: () async {
          final granted = await Permission.location.isGranted;
          if (granted) {
            await goToCurrentUserLocation();
          }
        },
      );
      WidgetsBinding.instance.addObserver(_lifeCycleObserver);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) => previous.waterSupplys != current.waterSupplys,
      builder: (context, state) {
        return MyAnimatedSwitcher(
          child: _buildChild(state.status,state.waterSupplys),
        );
      },
    );
  }

  Widget _buildChild(BaseStatusEnum status,List<WaterSupplyMapModel> waterSupplys) {
    switch (status) {
      case BaseStatusEnum.success:
      // ignore: prefer_collection_literals
      //loadMarker(waterSupplys);
      for(var ws in waterSupplys){
        //loadMarker(ws);
        // setState(() {
          
        // });
        // final Uint8List customMarker=await  getBytesFromAsset('http://maps.google.com/mapfiles/ms/icons/orange-dot.png', 50);

        var marker = Marker(
          //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
          markerId: MarkerId(ws.address.nameEn),
          position: LatLng(double.parse(ws.decimalDegreeLat), double.parse(ws.decimalDegreeLng)),
          infoWindow: InfoWindow(
            title: ws.waterSupplyCode,
            snippet: ws.waterSupplyType,
          ),
          //icon: BitmapDescriptor.fromBytes(customMarker)
          icon: markerIcon,
        );
        markers.add(marker);
      }
        return GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: position,
          onMapCreated: (controller) {
            completer.complete(controller);
            newGoogleMapController = controller;
            goToCurrentUserLocation();
          },
          markers: markers,
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

  Future<Uint8List> getBytesFromAsset(String path,int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(), 
      targetWidth: width
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  loadMarker(WaterSupplyMapModel ws) async{
    final Uint8List customMarker=await getBytesFromAsset('http://maps.google.com/mapfiles/ms/icons/orange-dot.png', 50);

        var marker = Marker(
          //icon: BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0),'http://maps.google.com/mapfiles/ms/icons/orange-dot.png') ,
          markerId: MarkerId(ws.address.nameEn),
          position: LatLng(double.parse(ws.decimalDegreeLat), double.parse(ws.decimalDegreeLng)),
          infoWindow: InfoWindow(
            title: ws.waterSupplyCode,
            snippet: ws.waterSupplyType,
          ),
          icon: BitmapDescriptor.fromBytes(customMarker)
        );
        markers.add(marker);
  }
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'assets/icons/info.png')
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
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
