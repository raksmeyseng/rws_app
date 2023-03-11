import 'package:rws_app/core/modules/setting/bloc/setting_bloc.dart';
import 'package:rws_app/core/modules/setting/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingBloc(),
      child: const Scaffold(
        // appBar: AppBar(),
        body: SettingView(),
      ),
    );
  }
}
