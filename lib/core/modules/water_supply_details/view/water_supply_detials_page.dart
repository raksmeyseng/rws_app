import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/filter/view/filter_page.dart';
import 'package:rws_app/core/modules/water_supplier_edit/view/water_supply_edit_page.dart';
import 'package:rws_app/core/modules/water_supply_details/bloc/water_supply_detials_bloc.dart';
import 'package:rws_app/core/modules/water_supply_details/repositories/water_supply_detials_repository.dart';
import 'package:rws_app/core/modules/water_supply_details/view/water_supply_detials_view.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/textbutton_icon.dart';
import 'package:rws_app/translation/generated/l10n.dart';

class WaterSupplyPage extends StatelessWidget {
  const WaterSupplyPage({
    super.key,
    required this.waterSupplyId,
    required this.title,
  });

  final int waterSupplyId;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WaterSupplyDetialsBloc(
        repository: WaterSupplyDetialsRepository(),
        waterSupplyId: waterSupplyId,
      )..add(
          const WaterSupplyStarted(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(title, color: AppColor.white),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: AddNewWaterManageSystem(
            //     onPress: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (_) {
            //             return FilterWaterSupplyPage(
            //               //title: title,
            //               waterSupplyTypeId: waterSupplyId,
            //             );
            //           },
            //         ),
            //       );
            //     },
            //     icon: Icons.add_circle_outlined,
            //     title: 'Search',
            //   ),
            // ),
            IconButton(
              color: AppColor.white,
              icon: const Icon(Icons.search),
              tooltip: 'Search here',
              onPressed: () {
                // handle the press
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return FilterWaterSupplyPage(
                        //title: title,
                        waterSupplyTypeId: waterSupplyId,
                      );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddNewWaterManageSystem(
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return WaterSupplyEditPage(
                          title: title,
                          waterSupplyId: waterSupplyId,
                        );
                      },
                    ),
                  );
                },
                icon: Icons.add_circle_outlined,
                title: S.of(context).button_create,
              ),
            ),
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const WaterSupplyDetialsView(),
      ),
    );
  }
}
