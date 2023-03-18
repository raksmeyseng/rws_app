import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/setting/bloc/setting_bloc.dart';
import 'package:rws_app/core/modules/setting/view/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: TextWidget(
            S.of(context).title_settings,
            color: AppColor.white,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: const SettingView(),
      ),
    );
  }
}
