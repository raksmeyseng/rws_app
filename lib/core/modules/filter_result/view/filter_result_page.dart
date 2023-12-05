import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/filter_result/bloc/filter_result_bloc.dart';
import 'package:rws_app/core/modules/filter_result/repositories/filter_result_repository.dart';
import 'package:rws_app/core/modules/filter_result/view/filter_result_view.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class FilterResultPage extends StatelessWidget {
  const FilterResultPage(
      {super.key,
      required this.waterSupplyTypeId,
      required this.waterSupplyCode,
      required this.provinceId,
      required this.districtId,
      required this.communeId,
      required this.villageId});

  final int waterSupplyTypeId;
  final String waterSupplyCode;
  final String provinceId;
  final String districtId;
  final String communeId;
  final String villageId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterResultBloc(
          waterSupplyTypeId: waterSupplyTypeId,
          waterSupplyCode: waterSupplyCode,
          provinceId: provinceId,
          districtId: districtId,
          communeId: communeId,
          villageId: villageId,
          repository: FilterResultRepository())
        ..add(const FilterResultStarted()),
      child: Scaffold(
        appBar: AppBar(
          title:
              TextWidget(waterSupplyTypeId.toString(), color: AppColor.white),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: AddNewWaterManageSystem(
            //     onPress: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (_) {
            //             return WaterSupplyEditPage(
            //               title: title,
            //               waterSupplyId: waterSupplyId,
            //             );
            //           },
            //         ),
            //       );
            //     },
            //     icon: Icons.add_circle_outlined,
            //     title: 'បង្កើតថ្មី',
            //   ),
            // ),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const FilterResultView(),
      ),
    );
  }
}
