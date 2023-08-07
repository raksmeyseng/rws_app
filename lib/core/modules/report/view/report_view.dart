import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/core/modules/report/bloc/report_bloc.dart';

import '../../../../config/routes/app_route.dart';
import '../../../../config/themes/app_color.dart';
import '../../../../translation/generated/l10n.dart';
import '../../../widgets/flat_card.dart';
import '../../../widgets/text_widget.dart';

class ReportView extends StatelessWidget{
  const ReportView({Key? key}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    List<String> reportTitle=[
      'របាយការណ៍អណ្ដូងលម្អិត',
      'របាយការណ៍អណ្ដូងគ្របដណ្ដប់លម្អិត',
      'របាយការណ៍គ្រប់ដណ្ដប់ប្រព័ន្ធផ្គត់ផ្គង់ទឹក',
      'របាយការណ៍គ្រប់ដណ្ដប់ប្រព័ន្ធផ្គត់ផ្គង់ទឹកជាផែនទី'
    ];
    List<String> reportUrls =[
      AppConstant.defaultURL+'km/watersupply/reportwellbyprovince/',
      AppConstant.defaultURL+'km/watersupply/reportwellbyprovince/',
      AppConstant.defaultURL+'km/watersupply/reportwellbyprovince/',
      AppConstant.defaultURL+'km/watersupply/reportwellbyprovince/',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('របាយការណ៍'),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            return _WaterSupplyItem(
              title: reportTitle[index],
              url:reportUrls[index]
              );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: reportTitle.length,
        ),
    );
  }
}


class _WaterSupplyItem extends StatelessWidget {
  const _WaterSupplyItem({Key? key,required this.title, required this.url}) : super(key: key);

  final String url;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: () {
        context.goNamed(
          AppRoute.reportDetail,
          extra: {
            
            'url': url,
          },
        );
      },
      borderRadius: 16.0,
      side: BorderSide(
        width: 1.5,
        color: Theme.of(context).dividerColor.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(title.toString(), height: 1.8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
