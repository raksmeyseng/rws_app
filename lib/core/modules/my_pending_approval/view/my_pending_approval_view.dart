import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/core/modules/my_pending_approval/bloc/my_pending_approval_bloc.dart';
import 'package:rws_app/core/modules/my_pending_approval/model/my_pending_approval_model.dart';

import '../../../../config/routes/app_route.dart';
import '../../../../config/themes/app_color.dart';
import '../../../../translation/generated/l10n.dart';
import '../../../../widgets/empty_widget.dart';
import '../../../../widgets/load_data_failed.dart';
import '../../../enum/base_status_enum.dart';
import '../../../widgets/caption_widget.dart';
import '../../../widgets/flat_card.dart';
import '../../../widgets/my_divider.dart';
import '../../../widgets/text_widget.dart';

class MyPendingApprovalView extends StatelessWidget {
  const MyPendingApprovalView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPendingApprovalBloc, MyPendingApprovalState>(
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
    return BlocBuilder<MyPendingApprovalBloc, MyPendingApprovalState>(
      buildWhen: (previous, current) =>
          previous.myPendingApproval != current.myPendingApproval,
      builder: (context, state) {
        if (state.myPendingApproval.isEmpty) {
          return const Center(child: EmptyWidget());
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            return _MyDraftItem(state.myPendingApproval[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: state.myPendingApproval.length,
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
    return BlocBuilder<MyPendingApprovalBloc, MyPendingApprovalState>(
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
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _InfoItem(
          //   CaptionWidget('${S.of(context).date_of_birth} :'),
          //   TextWidget(item.createdDate.toString()),
          // ),
          // _InfoItem(
          //   CaptionWidget('${S.of(context).user_name} :'),
          //   TextWidget('${item.user.firstName} ${item.user.lastName}'),
          // ),
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_type} :'),
            Flexible(
              child: TextWidget(
                appLocale.languageCode == 'en'
                    ? item.waterSupplyType
                    : item.waterSupplyType,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).village} :'),
            TextWidget(item.village?.nameEn),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).commune} :'),
            TextWidget(item.commune.nameEn),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).district} :'),
            TextWidget(item.district.nameEn),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).province} :'),
            TextWidget(item.address.nameEn),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: MyDivider(),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).status} :'),
            TextWidget(item.status.statusNameKh.toString(),
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
