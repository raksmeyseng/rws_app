import 'package:flutter/material.dart';
import 'package:rws_app/core/modules/my_approval_history/view/my_approval_history_page.dart';
import 'package:rws_app/core/modules/my_draft/view/my_draft_page.dart';
import 'package:rws_app/core/modules/my_history/view/my_history_page.dart';
import 'package:rws_app/core/modules/my_pending_approval/view/my_pending_approval_page.dart';
import 'package:rws_app/core/modules/my_task/model/my_task_model.dart';
import 'package:rws_app/translation/generated/l10n.dart';

import '../../../../config/routes/application.dart';

class MyTaskRepository {

  List<MyTaskModel> getTabs(BuildContext context) {

    //final userId = Application.authBloc.state.userToken?.user.id;
    final isDataEntry = Application.authBloc.state.userToken?.user.isDataEntry??false;
      //print('userid $isDataEntry');

    if( isDataEntry ){
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
    }else{
      return [
            MyTaskModel(
              name: S.of(context).draft,
              widget: const MyPendingApprovalPage(),
            ),
            MyTaskModel(
              name: S.of(context).history,
              widget: const MyApprovalHistoryPage(),
            ),
          ];
    }
    
  }
}
