import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/map/bloc/map_bloc.dart';
import 'package:rws_app/core/modules/map/view/maps_view.dart';

import '../../water_supply_details/repositories/water_supply_detials_repository.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(
        repository: WaterSupplyDetialsRepository(),
      )..add(const MapStarted()),
      child: const MapsView(),
    );
  }
}
