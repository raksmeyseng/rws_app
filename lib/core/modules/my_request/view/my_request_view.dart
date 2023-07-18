import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/my_request/bloc/my_request_bloc.dart';
import 'package:rws_app/core/modules/my_request/model/my_request_model.dart';
import 'package:rws_app/core/modules/water_supply_details/model/water_supply_model.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/my_divider.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/widgets/empty_widget.dart';

import '../../../widgets/load_data_failed.dart';

class MyRequestView extends StatelessWidget {
  const MyRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestBloc, MyRequestState>(
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
// Loading View
// ===================
class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestBloc, MyRequestState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
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
// Success View
// ===================
class _SuccessView extends StatelessWidget {
  const _SuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyRequestBloc, MyRequestState>(
      buildWhen: (previous, current) => previous.myRequest != current.myRequest,
      builder: (context, state) {
        if (state.myRequest.isEmpty) {
          return const Center(child: EmptyWidget());
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            return _MyRequestItem(state.myRequest[index]);
          },
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemCount: state.myRequest.length,
        );
      },
    );
  }
}

class _MyRequestItem extends StatelessWidget {
  const _MyRequestItem(this.item);

  final MyRequestModel item;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      borderRadius: 10,
      color: Theme.of(context).dividerColor.withOpacity(0.05),
      onTap: () {
        context.goNamed(
          AppRoute.waterSupplyViewDetail,
          extra: {
            'id': item.waterSupply.id.toString(),
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoItem(
            CaptionWidget('${S.of(context).date_of_birth} :'),
            TextWidget(item.waterSupply.createdDate.toString()),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).date_of_birth} :'),
            TextWidget(item.createdAt),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).water_supply_type} :'),
            Flexible(
              child: TextWidget(
                item.waterSupply.waterSupplyType,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).village} :'),
            TextWidget(item.waterSupply.village?.nameEn),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).commune} :'),
            TextWidget(item.waterSupply.commune?.nameEn),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).district} :'),
            TextWidget(item.waterSupply.district?.nameEn),
          ),
          _InfoItem(
            CaptionWidget('${S.of(context).province} :'),
            TextWidget(item.waterSupply.address.nameEn),
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