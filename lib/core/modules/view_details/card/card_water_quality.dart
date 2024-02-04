
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/models/water_quality_parameter.dart';
import 'package:rws_app/translation/generated/l10n.dart';

import '../../../widgets/caption_widget.dart';
import '../../../widgets/flat_card.dart';
import '../../../widgets/text_widget.dart';
import '../bloc/list_data_details_bloc.dart';

class CardWaterQuality extends StatelessWidget{

  const CardWaterQuality({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous,current)=>previous.status!=current.status,
      builder:(context, state){
        return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                   vertical: 10,
                   horizontal: 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ParameterItem(state.waterSupply!.wqcParam1!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam2!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam3!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam4!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam5!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam6!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam7!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam8!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam9!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam10!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam11!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam12!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam13!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam14!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam15!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                    _ParameterItem(state.waterSupply!.wqcParam16!.first),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
      
                    ),
                  ],
                ),
        );
      }
    );
  }


}

class _ParameterItem extends StatelessWidget{

  const _ParameterItem(this.item);

  final WaterSupplyWaterQualityParameterModel item;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      borderRadius: 10,
      color: Theme.of(context).dividerColor.withOpacity(0.05),
      onTap: () {
        
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoItem(
            CaptionWidget(S.of(context).parameter_code_report_viewer),
            TextWidget(item.parameter?.parameterCode),
          ),
          _InfoItem(
            CaptionWidget(S.of(context).parameter_report_viewer),
            Flexible(
              child: TextWidget(
                item.parameter?.parameter,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          
          _InfoItem(
            CaptionWidget(S.of(context).unit_report_viewer),
            TextWidget(item.parameter?.unit),
          ),
          _InfoItem(
            CaptionWidget(S.of(context).standard_water_report_viewer),
            TextWidget(item.parameter?.standartOfDrinkingWater),
          ),
          _InfoItem(
            CaptionWidget(S.of(context).value_report_viewer),
            TextWidget(item.value),
          ),
          
        ],
      ),
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