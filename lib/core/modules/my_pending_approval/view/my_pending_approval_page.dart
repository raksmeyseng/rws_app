import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/my_pending_approval/bloc/my_pending_approval_bloc.dart';

import 'my_pending_approval_view.dart';

class MyPendingApprovalPage extends StatelessWidget{
  const MyPendingApprovalPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyPendingApprovalBloc()..add(
        const MyPendingApprovalStarted()
      ),
      child: const MyPendingApprovalView(),
      );
  }


}