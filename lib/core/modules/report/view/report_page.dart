import 'package:flutter/material.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

import '../../../../translation/generated/l10n.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextWidget(S.of(context).report),
    );
  }
}
