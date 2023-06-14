import 'package:rws_app/core/enum/language_enum.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/modules/app/widgets/language_item.dart';
import 'package:rws_app/core/widgets/app_bar_title.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarTitle(title: S.of(context).language)),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children:const [
          SizedBox(height: 12.0),
          _Content(),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.language != current.language,
      builder: (context, state) {
        return FlatCard(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ...LanguageEnum.values.map((lang) {
                return LanguageItem(
                  flag: lang.getIconPath(),
                  title: lang.getDisplayText(context),
                  subtitle: lang.getSubDisplayText(context),
                  value: lang,
                  groupValue: state.language,
                  onChanged: (v) => _onLanguageChanged(context, v),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  void _onLanguageChanged(BuildContext context, LanguageEnum language) {
    context.read<AppBloc>().add(LanguageChanged(language));
  }
}
