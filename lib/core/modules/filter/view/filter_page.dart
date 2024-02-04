import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/filter/bloc/filter_bloc.dart';
import 'package:rws_app/core/modules/filter/repositories/filter_water_supply_repository.dart';
import 'package:rws_app/core/modules/filter/view/filter_view.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import '../../../../translation/generated/l10n.dart';

class FilterWaterSupplyPage extends StatelessWidget {
  const FilterWaterSupplyPage({super.key, required this.waterSupplyTypeId});
  final int waterSupplyTypeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc(
          repository: FilterWaterSupplyRepository(),
          waterSupplyTypeId: waterSupplyTypeId)
        ..add(const FilterStarted()),
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(S.of(context).search, color: AppColor.white),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const FilterWataerSupplyView(),
      ),
    );
  }
}
