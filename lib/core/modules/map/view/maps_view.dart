import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rws_app/core/animation/my_animated_switcher.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/map/bloc/map_bloc.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key});

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  Completer<GoogleMapController> completer = Completer();
  late GoogleMapController newGoogleMapController;

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
          onMapCreated: (controller) {
            completer.complete(controller);
            newGoogleMapController = controller;
          },
          initialCameraPosition: const CameraPosition(
            target: LatLng(37.4220, -122.0841),
            zoom: 14,
          ),
        );
      case BaseStatusEnum.failure:
        return const _FailureView();
      default:
        return const _LoadingView();
    }
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
