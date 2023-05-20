
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/my_approval_history/bloc/my_approval_history_bloc.dart';
import 'package:rws_app/core/modules/my_approval_history/view/my_approval_history_view.dart';

class MyApprovalHistoryPage extends StatelessWidget{

  const MyApprovalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyApprovalHistoryBloc()..add(const MyApprovalHistoryStarted()),
      child: const MyApprovalHistoryView(),
    );
  }

}