import 'package:rws_app/core/enum/base_status_enum.dart';
import 'package:rws_app/core/enum/language_enum.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/modules/authentication/repositories/user_repository.dart';
import 'package:rws_app/core/modules/language_dialog/cubit/language_dialog_cubit.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/my_simple_dialog.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageDialogCubit(UserRepository()),
      child: Builder(builder: (context) {
        return BlocListener<LanguageDialogCubit, LanguageDialogState>(
          listenWhen: (previous, current) =>
              previous.saveStatus != current.saveStatus,
          listener: (context, state) {
            if (state.saveStatus == BaseStatusEnum.success) {
              context
                  .read<AppBloc>()
                  .add(LanguageChanged(state.savingLanguage!));
              Navigator.of(context).pop();
            }
          },
          child: MySimpleDialog(
            title: S.of(context).language,
            content: BlocBuilder<AppBloc, AppState>(
              buildWhen: (previous, current) =>
                  previous.language != current.language,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...LanguageEnum.values.map((lang) {
                        return _LanguageItem(
                          lang,
                          selected: state.language == lang,
                          onSelected: context
                                      .watch<LanguageDialogCubit>()
                                      .state
                                      .saveStatus ==
                                  BaseStatusEnum.inprogress
                              ? null
                              : () {
                                  context
                                      .read<LanguageDialogCubit>()
                                      .saveLanguage(lang);
                                },
                        );
                      })
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  const _LanguageItem(
    this.lang, {
    Key? key,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final LanguageEnum lang;
  final bool selected;
  final void Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageDialogCubit, LanguageDialogState>(
      buildWhen: (previous, current) =>
          previous.saveStatus != current.saveStatus,
      builder: (context, state) {
        return ListTile(
          onTap: onSelected,
          selected: selected,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
          leading: ClipOval(
            child: Image.asset(
              lang.getIconPath(),
              fit: BoxFit.fill,
              width: 40,
              height: 40,
            ),
          ),
          title: TextWidget(lang.getDisplayText(context), bold: true),
          subtitle: CaptionWidget(lang.getSubDisplayText(context)),
          trailing: state.saveStatus == BaseStatusEnum.inprogress &&
                  state.savingLanguage == lang
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : (selected
                  ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                  : null),
        );
      },
    );
  }
}
