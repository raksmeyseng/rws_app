import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/water_supply_details/bloc/water_supply_detials_bloc.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/widgets/empty_widget.dart';

import '../../../../config/routes/app_route.dart';
import '../../../../translation/generated/l10n.dart';
import '../model/water_supply_list_model.dart';

class WaterSupplyDetialsView extends StatelessWidget {
  const WaterSupplyDetialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyDetialsBloc, WaterSupplyDetialsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case BaseStatusEnum.success:
            return const _SuccessView();
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
// Success View
// ===================
class _SuccessView extends StatelessWidget {
  const _SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyDetialsBloc, WaterSupplyDetialsState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if (state.waterSupply.isEmpty) {
          return const Center(child: EmptyWidget());
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            return _WaterSupplyItem(state.waterSupply[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: state.waterSupply.length,
        );
      },
    );
  }
}

// ===================
// Failure View
// ===================s
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
    return BlocBuilder<WaterSupplyDetialsBloc, WaterSupplyDetialsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _WaterSupplyItem extends StatelessWidget {
  const _WaterSupplyItem(this.item);

  final WaterSupplyListByTypeModel item;

  @override
  Widget build(BuildContext context) {
    final Locale appLocale = Localizations.localeOf(context);
    return FlatCard(
      borderRadius: 10,
      color: Theme.of(context).dividerColor.withOpacity(0.05),
      onTap: () {
        /*
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return const ListDetails();
            },
          ),
        );
        */
        print(item.id.toString());

        context.goNamed(
          AppRoute.waterSupplyViewDetail,
          extra: {
            'id': item.id.toString(),
            'title': item.waterSupplyTypeKh.toString(),
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_type} :'),
            Flexible(
              child: TextWidget(
                appLocale.languageCode == 'en'
                    ? item.waterSupplyTypeEn
                    : item.waterSupplyTypeKh,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_code} :'),
            TextWidget(item.waterSupplyCode),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).village} :'),
            TextWidget(appLocale.languageCode == 'en'
                ? item.villageNameEn
                : item.villageNameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).commune} :'),
            TextWidget(appLocale.languageCode == 'en'
                ? item.communeNameEn
                : item.communeNameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).district} :'),
            TextWidget(appLocale.languageCode == 'en'
                ? item.districtNameEn
                : item.districtNameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).province} :'),
            TextWidget(appLocale.languageCode == 'en'
                ? item.provinceNameEn
                : item.provinceNameKh),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8),
          //   child: MyDivider(),
          // ),
          // _InfoItem(
          //   CaptionWidget('${S.of(context).status} :'),
          //   TextWidget(
          //     item.status.statusNameKh,
          //     color: AppColor.success,
          //   ),
          // ),
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
