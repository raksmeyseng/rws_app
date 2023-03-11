import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/core/modules/change_password/bloc/change_password_bloc.dart';
import 'package:rws_app/core/modules/change_password/view/change_password_view.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../widgets/my_button.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(Application.userRepo),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: const _ChangePasswordTitle(),
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
        body: const ChangePasswordView(),
      ),
    );
  }
}

class _ChangePasswordTitle extends StatelessWidget {
  const _ChangePasswordTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      S.of(context).change_password,
      bold: true,
      size: 16,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : MyButton(
                maxWidth: 100,
                title: S.of(context).button_save,
                onPressed: () {
                  context
                      .read<ChangePasswordBloc>()
                      .add(const ChangePasswordSubmitted());
                },
              );
      },
    );
  }
}
