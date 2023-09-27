import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/core/modules/my_history/bloc/my_history_bloc.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';

import '../../../../config/routes/app_route.dart';
import '../../../../config/themes/app_color.dart';
import '../../../../widgets/empty_widget.dart';
import '../../../../widgets/load_data_failed.dart';
import '../../../enum/base_status_enum.dart';
import '../../../widgets/caption_widget.dart';
import '../../../widgets/flat_card.dart';
import '../../../widgets/my_divider.dart';
import '../../water_supply_details/model/water_supply_model.dart';

class MyHistoryView extends StatelessWidget {
  const MyHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyHistoryBloc, MyHistoryState>(
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
    return BlocBuilder<MyHistoryBloc, MyHistoryState>(
      buildWhen: (previous, current) => previous.myhistory != current.myhistory,
      builder: (context, state) {
        if (state.myhistory.isEmpty) {
          return const Center(child: EmptyWidget());
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            return _MyHistoryItem(state.myhistory[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: state.myhistory.length,
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
    return BlocBuilder<MyHistoryBloc, MyHistoryState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _MyHistoryItem extends StatelessWidget{

  const _MyHistoryItem(this.item);
   
   final WaterSupplyModel item;

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
            const CaptionWidget('លេខកូដសំណង់ :'),
            TextWidget(item.waterSupplyCode),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_type} :'),
            Flexible(
              child: TextWidget(
                item.waterSupplyType,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).village} :'),
            TextWidget(item.village?.nameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).commune} :'),
            TextWidget(item.commune.nameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).district} :'),
            TextWidget(item.district.nameKh),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).province} :'),
            TextWidget(item.address.nameKh),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: MyDivider(),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).status} :'),
            TextWidget(item.status.statusNameKh.toString(),
            color: AppColor.warning
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