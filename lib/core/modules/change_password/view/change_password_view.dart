import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/core/modules/authentication/bloc/auth_bloc.dart';
import 'package:rws_app/core/modules/change_password/bloc/change_password_bloc.dart';
import 'package:rws_app/core/modules/change_password/models/confirm_password.dart';
import 'package:rws_app/core/modules/change_password/models/password.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzStatus.submissionSuccess) {
          context.read<AuthBloc>().add(UserUpdated(state.user!));
          showSnackBar(
              context, S.of(context).your_password_changed_successfuly);
          context.goNamed(AppRoute.settings);
        }
      },
      child: const SizedBox.expand(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Wrapper(
                maxWidth: appContentMaxWidth,
                child: Wrap(
                  spacing: 40,
                  children: [
                    _FormField(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PasswordInput(),
        SizedBox(height: 24),
        _ConfirmPasswordInput(),
      ],
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CaptionWidget(
                '${S.of(context).new_password.toUpperCase()} *',
              ),
            ),
            const SizedBox(height: 4.0),
            MyTextInput(
              focusNode: context.read<ChangePasswordBloc>().newPinFocus,
              onChanged: (pin) =>
                  context.read<ChangePasswordBloc>().add(PasswordChanged(pin)),
              keyboardType: TextInputType.number,
              obscureText: !state.passwordVisibility,
              isRequired: true,
              suffixIcon: IconButton(
                icon: Icon(
                  state.passwordVisibility
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () => context
                    .read<ChangePasswordBloc>()
                    .add(const TogglePassVisibility()),
              ),
              errorText: _handleErrorText(context, state),
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                context
                    .read<ChangePasswordBloc>()
                    .confirmNewPinFocus
                    .requestFocus();
              },
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, ChangePasswordState state) {
    if (!state.password.invalid) return null;
    switch (state.password.error) {
      case PasswordValidationError.empty:
      case PasswordValidationError.invalid:
        return S.of(context).pls_input_your_password;
      default:
        return null;
    }
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CaptionWidget(
                '${S.of(context).confirm_new_password.toUpperCase()} *',
              ),
            ),
            const SizedBox(height: 4.0),
            MyTextInput(
              focusNode: context.read<ChangePasswordBloc>().confirmNewPinFocus,
              onChanged: (password) => context
                  .read<ChangePasswordBloc>()
                  .add(ConfirmPasswordChanged(password)),
              keyboardType: TextInputType.number,
              isRequired: true,
              obscureText: !state.confirmPassVisibility,
              suffixIcon: IconButton(
                icon: Icon(state.confirmPassVisibility
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () => context
                    .read<ChangePasswordBloc>()
                    .add(const ToggleConfirmPassVisibility()),
              ),
              errorText: _handleErrorText(context, state),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                context
                    .read<ChangePasswordBloc>()
                    .add(const ChangePasswordSubmitted());
              },
            ),
          ],
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, ChangePasswordState state) {
    if (!state.confirmPassword.invalid) return null;
    switch (state.confirmPassword.error) {
      case ConfirmPasswordValidationError.empty:
        return S.of(context).pls_input_your_password;
      case ConfirmPasswordValidationError.mismatch:
        return S.of(context).password_mismatch;
      default:
        return null;
    }
  }
}
