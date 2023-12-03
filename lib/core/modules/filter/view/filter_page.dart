import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/filter/bloc/filter_bloc.dart';
import 'package:rws_app/core/modules/filter/view/filter_view.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class FilterWaterSupplyPage extends StatelessWidget {
  const FilterWaterSupplyPage({super.key, required this.waterSupplyTypeId});
  final int waterSupplyTypeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilterBloc(waterSupplyTypeId: waterSupplyTypeId)
        ..add(const FilterStarted()),
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget('ស្វែងរក', color: AppColor.white),
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
        body: const FilterWataerSupplyView(),
      ),
    );
  }
}
