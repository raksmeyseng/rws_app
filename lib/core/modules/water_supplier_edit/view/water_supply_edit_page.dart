import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/water_supplier_edit/bloc/water_supply_edit_bloc.dart';
import 'package:rws_app/core/modules/water_supplier_edit/repositories/water_supply_edit_repository.dart';
import 'package:rws_app/core/modules/water_supplier_edit/view/water_supply_edit_view.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class WaterSupplyEditPage extends StatelessWidget {
  const WaterSupplyEditPage({
    super.key,
    required this.waterSupplyId,
    required this.title,
    this.id,
  });

  final int waterSupplyId;
  final String title;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaterSupplyEditBloc(
        repository: WaterSupplyEditRepository(),
        waterSupplyId: waterSupplyId,
        id: id ?? 0,
      )..add(const WaterSupplyStarted()),
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(title, color: AppColor.white),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const WaterSupplyEditView(),
      ),
    );
  }
}
