import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/view_details/card/card_data_field.dart';
import 'package:rws_app/core/modules/view_details/card/card_list_details.dart';
import 'package:rws_app/core/modules/view_details/card/card_qr_detail.dart';
import 'package:rws_app/core/modules/view_details/card/card_water_quality.dart';
import 'package:rws_app/widgets/empty_widget.dart';

import '../../../enum/base_status_enum.dart';
import '../bloc/list_data_details_bloc.dart';

class ListDataDetailsView extends StatelessWidget {
  const ListDataDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
        builder: (context, state) {
          
        if(state.status==BaseStatusEnum.success){
          int length =  state.waterSupply!.isWaterQualityCheck? 4:3;
          return DefaultTabController(
            length:length,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _TabBar(),
                Expanded(child: _TabBarView()),
              ],
            ),
          );
        }else{

          return const _LoadingView();
        }
          
      },
    );
    
  }
}

// ======================
// TabBar Widget
// ======================
class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
          builder: (context, state) {
            if(state.waterSupply!.isWaterQualityCheck){
              return TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Tab(text: 'មើលលម្អិត'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Tab(text: 'Specific'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Tab(text: 'ប៉ារ៉ាម៉ែត្រ')
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Tab(text: 'QR & Maps'),
                    )
                  ],
            );
            }else{
              return TabBar(
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Tab(text: 'មើលលម្អិត'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Tab(text: 'Specific Field'),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Tab(text: 'QR & Maps'),
                    )
                  ],
            );
            }
            
      },
    );

    

  }
}

// ======================
// TabBarView Widget
// ======================
class _TabBarView extends StatelessWidget {
  const _TabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if(state.waterSupply!.isWaterQualityCheck){
          return const TabBarView(
            children: [
              CardListDetails(),
              CardDataFields(),
              CardWaterQuality(),
              CardQRDetail(),
            ],
          );
        }else{
          return const TabBarView(
            children: [
              CardListDetails(),
              CardDataFields(),
              CardQRDetail(),
            ],
          );
        }
      },
    );

    
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
