import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/modules/water_supply/bloc/water_supply_bloc.dart';
import 'package:rws_app/core/modules/water_supply/model/water_supply_model.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/load_data_failed.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/widgets/empty_widget.dart';

class WaterSupplyView extends StatelessWidget {
  const WaterSupplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyBloc, WaterSupplyState>(
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
    return BlocBuilder<WaterSupplyBloc, WaterSupplyState>(
      buildWhen: (previous, current) =>
          previous.waterSupply != current.waterSupply,
      builder: (context, state) {
        if (state.waterSupply.isEmpty) {
          return const Center(child: EmptyWidget());
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          itemBuilder: (context, index) {
            return _WaterSupplyItem(item: state.waterSupply[index]);
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
    return BlocBuilder<WaterSupplyBloc, WaterSupplyState>(
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
  const _WaterSupplyItem({Key? key, required this.item}) : super(key: key);

  final WaterSupplyTypeModel item;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: () {
        context.goNamed(
          AppRoute.waterSupplyDetail,
          extra: {
            'id': item.id.toString(),
            'title': item.name.toString(),
          },
        );
      },
      borderRadius: 16.0,
      side: BorderSide(
        width: 1.5,
        color: Theme.of(context).dividerColor.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  item.id != 1 ? AssetPath.waterSupply : AssetPath.well,
                  color: Theme.of(context).iconTheme.color,
                  width: 18,
                  height: 18,
                ),
                const SizedBox(width: 16.0),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(item.name.toString(), height: 1.8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
