import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/my_draft/bloc/my_draft_bloc.dart';
import 'package:rws_app/core/modules/my_draft/repositories/my_draft_repository.dart';
import 'package:rws_app/core/modules/my_draft/view/my_dratf_view.dart';

class MyDraftPage extends StatelessWidget {
  const MyDraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyDraftBloc(MyDraftRepository())..add(const MyDraftStarted()),
      child: const MyDraftView(),
    );
  }
}
