import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/date_helper.dart';
import 'package:flutter/material.dart';

class RealTimeDate extends StatelessWidget {
  const RealTimeDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AssetPath.iconDateTime,
          color: Theme.of(context).iconTheme.color,
          width: 14,
          height: 14,
        ),
        const SizedBox(width: 8.0),
        StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            return TextWidget(
              DateHelper.formatDate(
                DateTime.now(),
                S.of(context).real_time_date_format,
              ),
            );
          },
        ),
      ],
    );
  }
}
