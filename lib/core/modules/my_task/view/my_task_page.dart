import 'package:flutter/material.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

import '../../../../translation/generated/l10n.dart';

class MyTaskPage extends StatelessWidget {
  const MyTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.task,
              size: 50,
              color: Theme.of(context).disabledColor,
            ),
            const SizedBox(height: 10),
            TextWidget(S.of(context).no_task),
          ],
        ),
      ),
    );
  }
}
