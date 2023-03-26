import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/my_task/bloc/my_task_bloc.dart';
import 'package:rws_app/core/modules/my_task/repositories/my_task_repository.dart';
import 'package:rws_app/core/modules/my_task/view/my_task_view.dart';

class MyTaskPage extends StatelessWidget {
  const MyTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyTaskBloc(MyTaskRepository())..add(const MyTaskStarted()),
      child: const MyTaskView(),
    );
  }
}
