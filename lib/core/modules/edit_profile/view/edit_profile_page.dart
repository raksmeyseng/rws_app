import 'package:rws_app/core/widgets/dialogs/confirm_dialog.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../bloc/edit_profile_bloc.dart';
import 'edit_profile_view.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc()..add(const EditProfileStarted()),
      child: Builder(builder: (context) {
        return WillPopScope(
          onWillPop: () => _onWillPop(context),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.5,
              title: const _TitleWidget(),
              centerTitle: true,
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 24.0,
                  ),
                  child: _SubmitButton(),
                ),
              ],
            ),
            body: const EditProfileView(),
          ),
        );
      }),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    final bloc = context.read<EditProfileBloc>();
    if (bloc.state.uploadedProfile != null || bloc.state.isFormChanged) {
      final confirmed = await DialogHelper.showAnimatedDialog<bool?>(
        pageBuilder: (context, a1, a2) {
          return ConfirmDialog(
            title: S.of(context).confirm,
            message: S.of(context).msg_confirm_discard_change,
            confirmText: S.of(context).button_leave,
          );
        },
      );
      return confirmed == true;
    } else {
      return true;
    }
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      S.of(context).edit_profile,
      bold: true,
      size: 16,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      buildWhen: (previous, current) =>
          previous.formStatus != current.formStatus,
      builder: (context, state) {
        return state.formStatus.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : MyButton(
                title: S.of(context).button_save,
                maxWidth: 100,
                onPressed: () => context
                    .read<EditProfileBloc>()
                    .add(const EditProfileFormSubmitted()),
              );
      },
    );
  }
}
