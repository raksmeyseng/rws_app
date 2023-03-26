import 'package:flutter/material.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';

class MyHistoryView extends StatelessWidget {
  const MyHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.history,
              size: 40,
              color: Theme.of(context).disabledColor,
            ),
            const SizedBox(height: 10),
            TextWidget(S.of(context).no_history),
          ],
        ),
      ),
    );
  }
}
