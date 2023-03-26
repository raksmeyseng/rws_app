import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/modules/water_supply/bloc/water_supply_bloc.dart';
import 'package:rws_app/core/modules/water_supply_details/water_supply_details.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class WaterSupplyView extends StatelessWidget {
  const WaterSupplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterSupplyBloc, WaterSupplyState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _FeatureItem(
                    iconSvg: AssetPath.well,
                    label: 'អណ្តូង',
                    processing: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsWaterSupply(
                            title: 'អណ្តូង',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _FeatureItem(
                    iconSvg: AssetPath.waterSupply,
                    label: 'ប្រព័ន្ធចែកចាយទឹកតាមបណ្តាញបំពង់ខ្នាតតូចសហគមន៍',
                    processing: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsWaterSupply(
                            title:
                                'ប្រព័ន្ធចែកចាយទឹកតាមបណ្តាញបំពង់ខ្នាតតូចសហគមន៍',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _FeatureItem(
                    iconSvg: AssetPath.waterSupply,
                    label: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
                    processing: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsWaterSupply(
                            title: 'ស្ថានីយ៍ផលិតទឹកផឹកសហគមន៍',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _FeatureItem(
                    iconSvg: AssetPath.waterSupply,
                    label: 'ស្រះសហគមន៍',
                    processing: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsWaterSupply(
                            title: 'ស្រះសហគមន៍',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _FeatureItem(
                    iconSvg: AssetPath.waterSupply,
                    label: 'អាងត្រងទឹកភ្លៀង',
                    processing: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsWaterSupply(
                            title: 'អាងត្រងទឹកភ្លៀង',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _FeatureItem(
                    iconSvg: AssetPath.waterSupply,
                    label: 'ប្រព័ន្ធចែកចាយទឹកតាមបណ្តាញបំពង់ឯកជន',
                    processing: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsWaterSupply(
                            title: 'ប្រព័ន្ធចែកចាយទឹកតាមបណ្តាញបំពង់ឯកជន',
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _FeatureItem(
                    iconSvg: AssetPath.waterSupply,
                    label: 'ស្ថានីយ៍ស្រូបទឹកពីបរិយាកាស',
                    processing: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsWaterSupply(
                            title: 'ស្ថានីយ៍ស្រូបទឹកពីបរិយាកាស',
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    Key? key,
    required this.iconSvg,
    required this.label,
    this.onTap,
    this.processing = false,
  }) : super(key: key);

  final String iconSvg;
  final String label;
  final void Function()? onTap;
  final bool processing;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: processing ? null : onTap,
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
                  iconSvg,
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
                      TextWidget(label, height: 1.8),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          processing
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const SizedBox(height: 0),
        ],
      ),
    );
  }
}
