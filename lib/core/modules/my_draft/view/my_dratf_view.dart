import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/my_draft/bloc/my_draft_bloc.dart';
import 'package:rws_app/core/modules/my_pending_approval/model/my_pending_approval_model.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/my_divider.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/widgets/empty_widget.dart';

import '../../../../config/routes/app_route.dart';
import '../../water_supply_details/model/water_supply_model.dart';

class MyDraftView extends StatelessWidget {
  const MyDraftView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDraftBloc, MyDraftState>(
      buildWhen: (previous, current) => previous.mydraft != current.mydraft,
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
    return BlocBuilder<MyDraftBloc, MyDraftState>(
      buildWhen: (previous, current) => previous.mydraft != current.mydraft,
      builder: (context, state) {
        if (state.mydraft.isEmpty) {
          return const Center(child: EmptyWidget());
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            // if(index==state.mydraft.length){
            //   return const _LoadingView();
            // }
            // else{
            //   return _MyDraftItem(state.mydraft[index]);
            // }
            return _MyDraftItem(state.mydraft[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: state.mydraft.length,
        );
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
    return BlocBuilder<MyDraftBloc, MyDraftState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _MyDraftItem extends StatelessWidget {
  const _MyDraftItem(this.item);

  final PendingApprovalModel item;

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

        context.goNamed(
          AppRoute.waterSupplyViewDetail,
          extra: {
            'id': item.id.toString(),
            'title': item.waterSupplyType.toString(),
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _InfoItem(
          //   CaptionWidget('${S.of(context).news_date} :'),
          //   TextWidget(item.createdDate.toString()),
          // ),
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_code} :'),
            TextWidget(item.waterSupplyCode),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_type} :'),
            Flexible(
              child: TextWidget(
                appLocale.languageCode == 'en'
                    ? item.waterSupplyTypeEn
                    : item.waterSupplyType,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).village} :'),
            TextWidget(appLocale.languageCode == 'en'
                ? item.village?.nameEn
                : item.village?.nameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).commune} :'),
            TextWidget(appLocale.languageCode == 'en'
                ? item.commune.nameEn
                : item.commune.nameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).district} :'),
            TextWidget(appLocale.languageCode == 'en'
                ? item.district.nameEn
                : item.district.nameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).province} :'),
            TextWidget(appLocale.languageCode == 'en'
                ? item.address.nameEn
                : item.address.nameKh),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: MyDivider(),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).status} :'),
            TextWidget(
                appLocale.languageCode == 'en'
                    ? item.status.statusName
                    : item.status.statusNameKh.toString(),
                color: AppColor.warning),
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
