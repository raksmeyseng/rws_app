import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/view_details/bloc/list_data_details_bloc.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/widgets/empty_widget.dart';

import '../../../../translation/generated/l10n.dart';
import '../../../../widgets/load_data_failed.dart';
import '../../../models/water_supply_well.dart';
import '../../../widgets/caption_widget.dart';
import '../../../widgets/flat_card.dart';
import '../../../widgets/my_divider.dart';


class CardDataFields extends StatelessWidget {
  const CardDataFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case BaseStatusEnum.success:
          
            switch(state.waterSupply?.waterSupplyTypeId){
              case 1:
                return const _WellView();
              case 2:
                return const _SmallPipeView();
              case 3: 
                return const _KioskView();
              case 4: 
                return const _PondView();
              case 5: 
                return const _RainView();
              case 6: 
                return const _PipeView(); 
              case 7: 
                return const _AirView(); 
              default:
                return const EmptyWidget();
            }

              
            
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
    return const LoadDataFailed();
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

class _WellView extends StatelessWidget {
  const _WellView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if (state.waterSupply?.waterSupplyWells?.isEmpty ?? true) {
          return const Center(child: EmptyWidget());
        }
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
                const CaptionWidget('ប្រភេទអណ្ដូង'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first.wellTypeObj.first
                          .valueObjs.first.nameKh ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),

              _InfoItem(
                const CaptionWidget('ជម្រៅអណ្ដូង (m)'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first.wellHeight ?? '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                const CaptionWidget('ជម្រៅតម្រង (Screen) (m)'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first.wellFilterHeight ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                const CaptionWidget('ធារទឹក (m3/h)'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first.wellWaterSupply ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                const CaptionWidget('នីរ៉ូស្តាទិច (m)'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first.wellNirostatic ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),

              _InfoItem(
                const CaptionWidget('នីរ៉ូឌីណាមិច (m)'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first.wellNirodynamic ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),

              _InfoItem(
                const CaptionWidget('គុណភាពទឹក'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first.wellWaterQualityObj
                          ?.first.nameKh ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),

              _InfoItem(
                const CaptionWidget('ត្រួតពិនិត្យគុណភាពទឹក'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first
                          .wellWaterQualityCheckObj?.first.nameKh ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),

              _InfoItem(
                const CaptionWidget('ស្ថានភាពអណ្ដូងទឹក'),
                TextWidget(
                  state.waterSupply?.waterSupplyWells?.first.wellStatusObj
                          ?.first.nameKh ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),

              _InfoItem(
                const CaptionWidget('ហេតុអ្វី'),
                TextWidget(state.waterSupply?.waterSupplyWells?.first.wellStatusReason),
              ),             

            ],
          ),
        );
      },
    );
  }
}


//START Small PIPE VIEW
class _SmallPipeView extends StatelessWidget {
  const _SmallPipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {

        if (state.waterSupply?.waterSupplyPipes?.isEmpty ?? true) {
          return const Center(child: EmptyWidget());
        }
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
                const CaptionWidget('ប្រភេទប្រភពទឹក'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipes?.first.source_type_of_water.first
                          .valueObjs.first.nameKh ??
                      '-',
                      
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
             _InfoItem(
                const CaptionWidget('សមត្ថភាពផលិតទឹក(ចំនួនប៊ីដុង/មួយថ្ងៃ)'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipes?.first.abilityOfProductWater,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),

              _InfoItem(
                const CaptionWidget('អាងក្រោមដី(m3)'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipes?.first.underGroudPoolStorage,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                const CaptionWidget('អាងអាកាស(m3)'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipes?.first.pool_air,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                const CaptionWidget('អាងចម្រោះ'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipes?.first.pool_filter_obj.first
                      .nameKh ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                const CaptionWidget('ចំនួនតំណដែលបានត'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipes?.first.number_of_link,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                           _InfoItem(
                const CaptionWidget('ការត្រួតពិនិត្យគុណភាពទឹក'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipes?.first.water_quality_check_obj.first
                      .nameKh ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                const CaptionWidget('ស្ថានភាពបណ្ដាញទឹក'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipes?.first.status_obj.first
                      .nameKh ??
                      '-',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
            ],
          ),
        );
      },
    );
  }
}


class _KioskView extends StatelessWidget {
  const _KioskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if (state.waterSupply?.watersupplykiosks?.isEmpty ?? true) {
          return const Center(child: EmptyWidget());
        }
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
                const CaptionWidget('ប្រភេទប្រភពទឹក:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.sourceTypeOfWater.first
                          .valueObjs.first.nameKh ??
                      '-',
                      
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
              _InfoItem(
                const CaptionWidget('សមត្ថភាពផលិតទឹក(ចំនួនប៊ីដុង/មួយថ្ងៃ):'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.abilityOfProductWater,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                   _InfoItem(
                const CaptionWidget('ប្រពន្ធចម្រោះទឹក:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.filterSystemObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                                _InfoItem(
                const CaptionWidget('ការត្រួតពិនិត្យគុណភាពទឹក:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.waterQualityCheckingObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                                            
             _InfoItem(
                const CaptionWidget('ស្ថានភាពបណ្ដាញទឹក:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.statusObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                _InfoItem(
                const CaptionWidget('មូលហេតុ:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.statusNoReason,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PondView extends StatelessWidget {
  const _PondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if (state.waterSupply?.waterSupplyCommunityPond?.isEmpty ?? true) {
          return const Center(child: EmptyWidget());
        }
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
                const CaptionWidget('ទទឹងស្រះ(ម៉ែត្រ):'),
                TextWidget(
                  state.waterSupply?.waterSupplyCommunityPond?.first.width,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                            _InfoItem(
                const CaptionWidget('បណ្ដោយស្រះ(ម៉ែត្រ):'),
                TextWidget(
                  state.waterSupply?.waterSupplyCommunityPond?.first.length,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ), 
                            _InfoItem(
                const CaptionWidget('ជម្រៅស្រះ(ម៉ែត្រ):'),
                TextWidget(
                  state.waterSupply?.waterSupplyCommunityPond?.first.height,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),  
                             _InfoItem(
                const CaptionWidget('អាងចម្រោះ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyCommunityPond?.first.filterSystemObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                                           _InfoItem(
                const CaptionWidget('ប្រភេទស្រះ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyCommunityPond?.first.typeOfPondObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                                           _InfoItem(
                const CaptionWidget('រដូវប្រាំង:'),
                TextWidget(
                  state.waterSupply?.waterSupplyCommunityPond?.first.isSummerHasWaterObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                                                         _InfoItem(
                const CaptionWidget('ស្ថានភាពស្រះ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyCommunityPond?.first.statusObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                                          _InfoItem(
                const CaptionWidget('(Reason):'),
                TextWidget(
                  state.waterSupply?.waterSupplyCommunityPond?.first.statusNoReason,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),            
            ],
          ),
        );
      },
    );
  }
}

class _RainView extends StatelessWidget {
  const _RainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if (state.waterSupply?.waterSupplyRainWaterHarvesting?.isEmpty ?? true) {
          return const Center(child: EmptyWidget());
        }
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
                const CaptionWidget('ប្រភេទនៃការប្រើប្រាស់:'),
                TextWidget(
                  state.waterSupply?.waterSupplyRainWaterHarvesting?.first.typeOfUsing.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                             _InfoItem(
                const CaptionWidget('ចំណុះ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyRainWaterHarvesting?.first.capacityOfRainWaterHarvesting.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
               _InfoItem(
                const CaptionWidget('ត្រួតពិនិត្យគុណភាពទឹក:'),
                TextWidget(
                  state.waterSupply?.waterSupplyRainWaterHarvesting?.first.waterQualityCheckObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
               _InfoItem(
                const CaptionWidget('ស្ថានភាពអាង:'),
                TextWidget(
                  state.waterSupply?.waterSupplyRainWaterHarvesting?.first.statusObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                             _InfoItem(
                const CaptionWidget('មូលហេតុ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyRainWaterHarvesting?.first.statusNoReason,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),                             
           
            ],
          ),
        );
      },
    );
  }
}

class _PipeView extends StatelessWidget {
  const _PipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if (state.waterSupply?.waterSupplyPipe?.isEmpty ?? true) {
          return const Center(child: EmptyWidget());
        }
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
                const CaptionWidget('សមត្ថភាពផលិតទឹក(ចំនួនប៊ីដុង/មួយថ្ងៃ):'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.abiltyOfProduceWater,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                            _InfoItem(
                const CaptionWidget('អាងក្រោមដី(m3):'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.undergroundPoolStorage,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
             _InfoItem(
                const CaptionWidget('អាងអាកាស(m3):'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.poolAir,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
               _InfoItem(
                const CaptionWidget('អាងចម្រោះ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.poolFilterObj?.first
                      .nameKh ??
                      '-',
                ),
              ),
              _InfoItem(
                const CaptionWidget('ចំនួនតំណដែលបានត:'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.numberOfLink,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                             _InfoItem(
                const CaptionWidget('ប្រវែងបណ្ដាញទុយោ​មេ (m):'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.pipeLength,
                ),
              ),              
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                             _InfoItem(
                const CaptionWidget('ភូមិ/ឃុំគ្របដណ្ដប់:'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.areaCovering,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                             _InfoItem(
                const CaptionWidget('ប្រពន្ធចម្រោះទឹក:'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.poolFilterObj?.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                             _InfoItem(
                const CaptionWidget('អាជ្ញាប័ណ្ណ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.isHasLicenseObj?.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                                           _InfoItem(
                const CaptionWidget('ថ្ងៃ ខែ ឆ្នាំផុតកំណត់អាជ្ញាប័ណ្ណ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.licenseExpiredDate,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                                         _InfoItem(
                const CaptionWidget('ថ្ងៃ ខែ ឆ្នាំទទួលបានអាជ្ញាប័ណ្ណ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.licenseRegisteredDate,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),                 
                     
                             _InfoItem(
                const CaptionWidget('មូលហេតុ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyPipe?.first.statusNoReason,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),                          
             /* _InfoItem(
                const CaptionWidget('ស្ថានភាពបណ្ដាញទឹក:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.statusObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                _InfoItem(
                const CaptionWidget('មូលហេតុ:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.statusNoReason,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ), */
            ],
          ),
        );
      },
    );
  }
}

class _AirView extends StatelessWidget {
  const _AirView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if (state.waterSupply?.waterSupplyAirWater?.isEmpty ?? true) {
          return const Center(child: EmptyWidget());
        }
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
                const CaptionWidget('សមត្ថភាពផលិតទឹក(ចំនួនប៊ីដុង/មួយថ្ងៃ):'),
                TextWidget(
                  state.waterSupply?.waterSupplyAirWater?.first.abiltyOfProduceWater,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                   _InfoItem(
                const CaptionWidget('ត្រួតពិនិត្យគុណភាពទឹក:'),
                TextWidget(
                  state.waterSupply?.waterSupplyAirWater?.first.waterQualityCheckObj?.first.nameKh ??'-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                          _InfoItem(
                const CaptionWidget('ប្រពន្ធចម្រោះទឹក:'),
                TextWidget(
                  state.waterSupply?.waterSupplyAirWater?.first.filterSystemObj?.first.nameKh??'-',
                  
                ),
              ),         
             
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                   _InfoItem(
                const CaptionWidget('ត្រួតពិនិត្យគុណភាពទឹក:'),
                TextWidget(
                  state.waterSupply?.waterSupplyAirWater?.first.waterQualityCheckObj?.first.nameKh ??'-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
             _InfoItem(
                const CaptionWidget('ស្ថានភាពស្ថានីយ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyAirWater?.first.statusObj?.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                            _InfoItem(
                const CaptionWidget('មូលហេតុ:'),
                TextWidget(
                  state.waterSupply?.waterSupplyRainWaterHarvesting?.first.statusNoReason,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),                              
             /* _InfoItem(
                const CaptionWidget('ស្ថានភាពបណ្ដាញទឹក:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.statusObj.first
                      .nameKh ??
                      '-',
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ),
                _InfoItem(
                const CaptionWidget('មូលហេតុ:'),
                TextWidget(
                  state.waterSupply?.watersupplykiosks?.first.statusNoReason,
                ),
              ),         
                 const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: MyDivider(),
              ), */
            ],
          ),
        );
      },
    );
  }
}

class Diagrams extends StatelessWidget {
  const Diagrams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StoreDiagrams> namelist = [];
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000010',
      parameters: 'អឺកូលី E.coli or thermotolerant coliform',
      unit: 'CFU or MPN/100ml',
      waterQuality: '0',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
        parameterCode: 'PA000020',
        parameters: 'អាសេនិក Arsenic (As)',
        unit: 'mg/l',
        waterQuality: '< 0.03',
        price: 0.00));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000030',
      parameters: 'សំណល់ក្លរ (Free Chlorine)',
      unit: 'mg/l',
      waterQuality: '0.2 - 0.5',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000040',
      parameters: 'ក្លរួ Chloride (Cl-)',
      unit: 'mg/l',
      waterQuality: '< 250',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000050',
      parameters: 'ភ្លុយអរួ Fluoride (F-)',
      unit: 'mg/l',
      waterQuality: '< 1.5',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000060',
      parameters: 'ដែក Iron (Fe)',
      unit: 'mg/l',
      waterQuality: '< 0.3',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000070',
      parameters: 'អាលុយមីញ៉ូម Aluminium (AL)',
      unit: 'mg/l',
      waterQuality: '< 0.2',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000080',
      parameters: 'ភាពរឹងសរុប (Total Hardness in CaCO3 )',
      unit: 'mg/l',
      waterQuality: '< 400',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000090',
      parameters: 'សំណ (Pb)',
      unit: 'mg/l',
      waterQuality: '< 0.01',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000100',
      parameters: 'ម៉ង់កាណែស Manganese (Mn)',
      unit: 'mg/l',
      waterQuality: '< 0.3',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000110',
      parameters: 'នីត្រាត Nitrate (NO3- )',
      unit: 'mg/l',
      waterQuality: '< 50',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000120',
      parameters: 'នីទ្រីត Nitrite (NO2-)',
      unit: 'mg/l',
      waterQuality: '< 3',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000130',
      parameters: 'អាម៉ូញ៉ាក់ (NH3 )',
      unit: 'mg/l',
      waterQuality: '< 1.5',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000140',
      parameters: 'សារធាតុរឹង​រលាយសរុប (TDS)',
      unit: 'mg/l',
      waterQuality: '< 800',
      price: 0.00,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000150',
      parameters: 'pH',
      unit: 'n/a',
      waterQuality: '6.5-8.5',
      price: 0.0,
    ));
    namelist.add(StoreDiagrams(
      parameterCode: 'PA000160',
      parameters: 'ភាពល្អក់ (Turbidity)',
      unit: 'NTU',
      waterQuality: '8',
      price: 0.00,
    ));

    return BlocBuilder<ListDataDetailsBloc, ListDataDetailsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    _InfoItem(
                      CaptionWidget('${S.of(context).province} :'),
                      TextWidget(state.waterSupply?.waterSupplyWells?.first.id
                          .toString()),
                    ),
                    // title details
                    // Table(
                    //   border: TableBorder.all(
                    //     width: 0.5,
                    //     color: AppColor.black,
                    //   ),
                    //   defaultColumnWidth: const FixedColumnWidth(150.0),
                    //   children: const [
                    //     TableRow(children: [
                    //       Padding(
                    //         padding: EdgeInsets.all(5),
                    //         child: TextWidget(
                    //           'ប៉ារាម៉ែត្រ កូដ',
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.all(5),
                    //         child: TextWidget(
                    //           'ប៉ារាម៉ែត្រ',
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.all(5),
                    //         child: TextWidget(
                    //           'ឯកតា',
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.all(5),
                    //         child: TextWidget(
                    //           'ស្តង់ដាគុណភាពទឹកផឹក?',
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.all(5),
                    //         child: TextWidget(
                    //           'តម្លៃ',
                    //           textAlign: TextAlign.center,
                    //         ),
                    //       ),
                    //     ]),
                    //   ],
                    // ),
                    // // view details
                    // Table(
                    //   border: TableBorder.all(
                    //     width: 0.5,
                    //     color: AppColor.black,
                    //   ),
                    //   defaultColumnWidth: const FixedColumnWidth(150.0),
                    //   children: namelist.map((diagram) {
                    //     return TableRow(
                    //       children: [
                    //         TableCell(
                    //           child: Padding(
                    //               padding: const EdgeInsets.all(5),
                    //               child: TextWidget(diagram.parameterCode)),
                    //         ),
                    //         TableCell(
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5),
                    //             child: TextWidget(diagram.parameters),
                    //           ),
                    //         ),
                    //         TableCell(
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5),
                    //             child: TextWidget(diagram.unit),
                    //           ),
                    //         ),
                    //         TableCell(
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5),
                    //             child: TextWidget(diagram.waterQuality),
                    //           ),
                    //         ),
                    //         TableCell(
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(5),
                    //             child: TextWidget(
                    //               diagram.price.toString(),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     );
                    //   }).toList(),
                    // )
                  ],
                )),
          ),
        );
      },
    );
  }
}

class StoreDiagrams {
  StoreDiagrams(
      {required this.parameterCode,
      required this.parameters,
      required this.unit,
      required this.waterQuality,
      required this.price});

  String parameterCode;
  String parameters;
  String unit;
  String waterQuality;
  double price;
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

class _WellTypeItem extends StatelessWidget {
  const _WellTypeItem(this.item, {Key? key}) : super(key: key);

  final WaterSupplyOptionModel? item;

  @override
  Widget build(Object context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CaptionWidget('Well Type'),
        TextWidget(item?.valueObjs.first.nameKh),
      ],
    );
  }
}

class _WaterQualityParameterItem extends StatelessWidget {
  //const _WaterSupplyItem(this.item);

  //final WaterSupplyModel item;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      borderRadius: 10,
      color: Theme.of(context).dividerColor.withOpacity(0.05),
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_code} :'),
            const TextWidget('Code'),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_type} :'),
            const Flexible(
              child: TextWidget(
                'TTT',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          
          
        ],
      ),
    );
  }
}