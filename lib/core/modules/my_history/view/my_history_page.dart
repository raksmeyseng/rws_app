import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/my_history/bloc/my_history_bloc.dart';
import 'package:rws_app/core/modules/my_history/view/my_history_view.dart';

class MyHistoryPage extends StatelessWidget {
  const MyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyHistoryBloc()..add(const MyHistoryStarted()),
      child: const MyHistoryView(),
    );
  }
}
