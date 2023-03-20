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
    target: LatLng(11.562108, 104.888535),
    zoom: 12,
  );
  Set<Marker> markers = <Marker>{
    const Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(11.579732, 104.870765),
      infoWindow: InfoWindow(
        title: 'Marker 1',
        snippet: 'This is marker 1',
      ),
    ),
    const Marker(
      markerId: MarkerId('marker2'),
      position: LatLng(11.577233, 104.886882),
      infoWindow: InfoWindow(
        title: 'Marker 2',
        snippet: 'This is marker 2',
      ),
    ),
    const Marker(
      markerId: MarkerId('marker3'),
      position: LatLng(11.564737, 104.863576),
      infoWindow: InfoWindow(
        title: 'Marker 3',
        snippet: 'This is marker 3',
      ),
    ),
    const Marker(
      markerId: MarkerId('marker3'),
      position: LatLng(11.554539, 104.863432),
      infoWindow: InfoWindow(
        title: 'Marker 3',
        snippet: 'This is marker 3',
      ),
    ),
    const Marker(
      markerId: MarkerId('marker3'),
      position: LatLng(11.547740, 104.884858),
      infoWindow: InfoWindow(
        title: 'Marker 3',
        snippet: 'This is marker 3',
      ),
    ),
  };

  @override
  void initState() {
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
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MyAnimatedSwitcher(
          child: _buildChild(state.status),
        );
      },
    );
  }

  Widget _buildChild(BaseStatusEnum status) {
    switch (status) {
      case BaseStatusEnum.success:
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

  Future<void> goToCurrentUserLocation({double zoom = 14}) async {
    try {
      final GoogleMapController controller = await completer.future;
      final pos = await getCurrentPosition();
      if (pos != null) {
        controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(pos.latitude, pos.longitude),
              zoom: zoom,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    if (!kIsWeb) {
      WidgetsBinding.instance.removeObserver(_lifeCycleObserver);
    }
    super.dispose();
  }
}

// =================
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
