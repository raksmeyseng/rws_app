import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/widgets/real_time_date.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(children: [
          RealTimeDate(),
          Spacer(),
          _VersionWidget(),
        ]),
      ),
    );
  }
}

class _VersionWidget extends StatelessWidget {
  const _VersionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.packageInfo != current.packageInfo,
      builder: (context, state) {
        return TextWidget(
          '${S.of(context).version}: ${state.packageInfo?.version}',
        );
      },
    );
  }
}
