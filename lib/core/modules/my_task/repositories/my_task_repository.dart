import 'package:flutter/material.dart';
import 'package:rws_app/core/modules/my_draft/view/my_draft_page.dart';
import 'package:rws_app/core/modules/my_history/view/my_history_page.dart';
import 'package:rws_app/core/modules/my_task/model/my_task_model.dart';
import 'package:rws_app/translation/generated/l10n.dart';

class MyTaskRepository {
  List<MyTaskModel> getTabs(BuildContext context) {
    return [
      MyTaskModel(
        name: S.of(context).draft,
        widget: const MyDraftPage(),
      ),
      MyTaskModel(
        name: S.of(context).history,
        widget: const MyHistoryPage(),
      ),
    ];
  }
}
