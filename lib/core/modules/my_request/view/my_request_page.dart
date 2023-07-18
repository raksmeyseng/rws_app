import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/my_pending_approval/bloc/my_pending_approval_bloc.dart';
import 'package:rws_app/core/modules/my_request/bloc/my_request_bloc.dart';
import 'package:rws_app/core/modules/my_request/view/my_request_view.dart';

class MyRequestPage extends StatelessWidget{
  const MyRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyRequestBloc()..add(const MyRequestStarted()),
      child: const MyRequestView(),
    );
  }


}