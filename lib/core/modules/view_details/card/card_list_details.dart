import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/view_details/bloc/list_data_details_bloc.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';

import '../../../widgets/my_divider.dart';

class CardListDetails extends StatelessWidget {
  const CardListDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case BaseStatusEnum.success:
            return const _ContentView();
          case BaseStatusEnum.failure:
            return const _FailureView();
          default:
            return const _LoadingView();
        }
      },
    );
  }
}

// ===================
// Failure View
// ===================
class _FailureView extends StatelessWidget {
  const _FailureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: LoadDataFailed());
  }
}

// ===================
// Loading View
// ===================
class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView();

  @override
  Widget build(BuildContext context) {
    List<String> titleViews = [
      S.of(context).water_supply_type, //0
      S.of(context).water_supply_code, //1
      S.of(context).province, //2
      S.of(context).district, //3
      S.of(context).commune, //4
      S.of(context).village, //5
      S.of(context).map_unit, //6
      S.of(context).utm_x, //7
      S.of(context).utm_y, //8
      S.of(context).total_family, //9
      S.of(context).risk_enviroment, //10
      S.of(context).construction_date, //11
      S.of(context).budget_source, //12
      S.of(context).construction_by, //13
      S.of(context).management_type, //14
      S.of(context).managed_by, //15
      S.of(context).beneficiary_total_people, //16
      S.of(context).beneficiary_total_women, //17
      S.of(context).beneficiary_total_family, //18
      S.of(context).beneficiary_total_family_poor_1, //19
      S.of(context).beneficiary_total_family_poor_2, //20
      S.of(context).beneficiary_total_family_indigenous, //21
      S.of(context).beneficiary_total_family_vulnerable //22
    ];

    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoItem(
                CaptionWidget('${titleViews[0]} :'),
                //TextWidget(state.waterSupply?.waterSupplyType),
                Flexible(
                  child: TextWidget(
                    state.waterSupply?.waterSupplyType,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[1]} :'),
                TextWidget(state.waterSupply?.waterSupplyCode),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[2]} :'),
                TextWidget(state.waterSupply?.address.nameKh),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[3]} :'),
                TextWidget(state.waterSupply?.district.nameKh),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[4]} :'),
                TextWidget(state.waterSupply?.commune.nameKh),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[5]} :'),
                TextWidget(state.waterSupply?.village?.nameKh),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[6]} :'),
                TextWidget(state.waterSupply?.mapUnitId == 1
                    ? 'UTM'
                    : state.waterSupply?.mapUnitId == 2
                        ? 'Decimal Degree'
                        : 'Degree Minute Seconds'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[7]} :'),
                TextWidget(state.waterSupply?.mapUnitId == 1
                    ? double.parse(state.waterSupply?.utmX ?? '0')
                        .toStringAsFixed(0)
                    : state.waterSupply?.mapUnitId == 2
                        ? state.waterSupply?.decimalDegreeLat
                        : '$state.waterSupply?.mdsXDegree:$state.waterSupply?.mdsXMinute:$state.waterSupply?.mdsXSecond'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[8]} :'),
                TextWidget(state.waterSupply?.mapUnitId == 1
                    ? double.parse(state.waterSupply?.utmY ?? '0')
                        .toStringAsFixed(0)
                    : state.waterSupply?.mapUnitId == 2
                        ? state.waterSupply?.decimalDegreeLng
                        : '$state.waterSupply?.mdsYDegree:$state.waterSupply?.mdsYMinute:$state.waterSupply?.mdsYSecond'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[9]} :'),
                TextWidget(state.waterSupply?.totalFamily.toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[10]} :'),
                TextWidget(state.waterSupply?.isRiskEnviromentArea == true
                    ? 'ប្រឈម'
                    : 'មិនប្រឈម'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[11]} :'),
                TextWidget(state.waterSupply?.constructionDate),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[12]} :'),
                TextWidget(state.waterSupply?.sourceBudget == 0
                    ? 'រដ្ខ'
                    : state.waterSupply?.sourceBudget == 1
                        ? 'អង្គការ'
                        : 'សប្បុរស'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[13]} :'),
                TextWidget(state.waterSupply?.constructedBy),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[14]} :'),
                TextWidget(
                    state.waterSupply?.managementType == 0 ? 'សហគមន៍' : 'ឯកជន'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[15]} :'),
                TextWidget(state.waterSupply?.managedBy),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[16]} :'),
                TextWidget(
                    state.waterSupply?.beneficiaryTotalPeople.toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[17]} :'),
                TextWidget(state.waterSupply?.beneficiaryTotalWoman.toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[18]} :'),
                TextWidget(
                    state.waterSupply?.beneficiaryTotalFamily.toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[19]} :'),
                TextWidget(
                    state.waterSupply?.beneficiaryTotalFamilyPoor1.toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[20]} :'),
                TextWidget(
                    state.waterSupply?.beneficiaryTotalFamilyPoor2.toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[21]} :'),
                TextWidget(state.waterSupply?.beneficiaryTotalFamilyVulnearable
                    .toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                CaptionWidget('${titleViews[22]} :'),
                TextWidget(state.waterSupply?.beneficiaryTotalFamilyIndigenous
                    .toString()),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
            ],
          ),

          // child: ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: titleViews.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return FlatCard(
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 10,
          //         horizontal: 16,
          //       ),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Expanded(
          //             flex: 2,
          //             child: CaptionWidget(
          //               '${titleViews[index]} : ',
          //             ),
          //           ),
          //           Expanded(
          //             flex: 1,
          //             child: TextWidget(
          //               index==0? state.waterSupply?.waterSupplyType:
          //               index==1?state.waterSupply?.waterSupplyCode:
          //               index==2?state.waterSupply?.address.nameEn:
          //               index==3?state.waterSupply?.district.nameEn:
          //               index==4?state.waterSupply?.commune.nameEn:
          //               index==5?state.waterSupply?.village.nameEn:
          //               index==6?state.waterSupply?.mapUnitId==1?'UTM':state.waterSupply?.mapUnitId==2?'Decimal Degree':'Degree Minute Seconds'  :
          //               index==7?state.waterSupply?.mapUnitId==1?state.waterSupply?.utmX:state.waterSupply?.mapUnitId==2?state.waterSupply?.decimalDegreeLat: '$state.waterSupply?.mdsXDegree:$state.waterSupply?.mdsXMinute:$state.waterSupply?.mdsXSecond' :
          //               index==8?state.waterSupply?.mapUnitId==1?state.waterSupply?.utmY:state.waterSupply?.mapUnitId==2?state.waterSupply?.decimalDegreeLng: '$state.waterSupply?.mdsYDegree:$state.waterSupply?.mdsYMinute:$state.waterSupply?.mdsYSecond' :
          //               ' ',
          //               textAlign: TextAlign.end,
          //             ),
          //           ),
          //         ],
          //       ),
          //     );
          //   },
          // ),
        );
      },
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem(this.label, this.value, {Key? key}) : super(key: key);

  final Widget label;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [label, value],
    );
  }
}
