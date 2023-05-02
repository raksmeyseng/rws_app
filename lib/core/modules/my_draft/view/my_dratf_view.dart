import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/my_draft/bloc/my_draft_bloc.dart';
import 'package:rws_app/core/modules/my_draft/models/my_draft_model.dart';
import 'package:rws_app/core/modules/view_details/view/list_details.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/my_divider.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/widgets/empty_widget.dart';

import '../../../../config/routes/app_route.dart';

class MyDraftView extends StatelessWidget {
  const MyDraftView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDraftBloc, MyDraftState>(
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
    return BlocBuilder<MyDraftBloc, MyDraftState>(
      buildWhen: (previous, current) => previous.mydraft != current.mydraft,
      builder: (context, state) {
        if (state.mydraft.isEmpty) {
          return const Center(child: EmptyWidget());
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
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

  final MyDraftModel item;

  @override
  Widget build(BuildContext context) {
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
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_type} :'),
            TextWidget(item.waterSupplyType),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).village} :'),
            TextWidget(item.address.village),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).commune} :'),
            TextWidget(item.address.commune),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).district} :'),
            TextWidget(item.address.district),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).province} :'),
            TextWidget(item.address.province),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: MyDivider(),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).status} :'),
            const TextWidget(
              'ដាក់ស្នើសុំ',
              color: AppColor.warning,
            ),
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
