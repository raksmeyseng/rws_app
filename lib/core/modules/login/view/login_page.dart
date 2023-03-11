import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/modules/login/bloc/login_bloc.dart';
import 'package:rws_app/core/modules/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authRepo: Application.authRepo,
        userRepo: Application.userRepo,
      ),
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: const LoginView(),
      ),
    );
  }
}
