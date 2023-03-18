import 'package:flutter/material.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Wrapper(
          maxWidth: appSmallMaxWidth,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _FeatureMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureMenu extends StatelessWidget {
  const _FeatureMenu();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Expanded(
          child: _WaterSupply(),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _Report(),
        ),
      ],
    );
  }
}

class _WaterSupply extends StatelessWidget {
  const _WaterSupply();

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      borderRadius: 14,
      side: BorderSide(
        width: 1.5,
        color: Theme.of(context).dividerColor.withOpacity(0.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.water),
          const SizedBox(width: 10),
          TextWidget(S.of(context).water_supply),
        ],
      ),
    );
  }
}

class _Report extends StatelessWidget {
  const _Report();

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      borderRadius: 14,
      side: BorderSide(
        width: 1.5,
        color: Theme.of(context).dividerColor.withOpacity(0.2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.assessment),
          const SizedBox(width: 10),
          TextWidget(S.of(context).report),
        ],
      ),
    );
  }
}
