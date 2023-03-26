import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/water_supply/bloc/water_supply_bloc.dart';
import 'package:rws_app/core/modules/water_supply/view/water_supply_view.dart';

class WaterSupplyPage extends StatelessWidget {
  const WaterSupplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaterSupplyBloc()
        ..add(
          const WaterSupplyStarted(),
        ),
      child: const WaterSupplyView(),
    );
  }
}
