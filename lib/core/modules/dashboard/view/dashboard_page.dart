import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:rws_app/core/modules/login/widgets/app_logo.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            title: const _TitleWidget(),
            centerTitle: true,
          ),
          body: Center(
            child: TextWidget(S.of(context).greeting),
          ),
        );
      }),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppLogo(size: 25),
        const SizedBox(width: 16.0),
        TextWidget(
          S.of(context).appName,
          bold: true,
          size: 16,
        ),
      ],
    );
  }
}
