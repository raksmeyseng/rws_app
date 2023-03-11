import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rws_app/core/modules/login/bloc/login_bloc.dart';
import 'package:rws_app/core/modules/login/models/email_input.dart';
import 'package:rws_app/core/modules/login/models/password_input.dart';
import 'package:rws_app/core/modules/login/widgets/app_logo.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/toggle_theme_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ContentView();
  }
}

class _ContentView extends StatelessWidget {
  const _ContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ToggleThemeWidget(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 40,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppLogo(),
                    const SizedBox(height: 16),
                    TextWidget(
                      S.of(context).login,
                      bold: true,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Wrapper(
                  maxWidth: appSmallMaxWidth,
                  center: false,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _EmailInput(
                          fillColor:
                              Theme.of(context).dividerColor.withOpacity(.1),
                        ),
                        const SizedBox(height: 16.0),
                        _PasswordInput(
                          fillColor:
                              Theme.of(context).dividerColor.withOpacity(.1),
                        ),
                        const SizedBox(height: 32),
                        const _LoginButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key, this.fillColor}) : super(key: key);

  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.emailInput != current.emailInput,
      builder: (context, state) {
        return MyTextInput(
          isRequired: true,
          label: S.of(context).email,
          initialValue: state.emailInput.value,
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) {
            context.read<LoginBloc>().add(LoginEmailChanged(email));
          },
          fillColor: fillColor,
          errorText: _handleErrorText(context, state),
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, LoginState state) {
    if (!state.emailInput.invalid) return null;
    switch (state.emailInput.error) {
      case EmailInputValidationError.empty:
        return S.of(context).pls_input_your_email;
      case EmailInputValidationError.invalid:
        return S.of(context).invalid_email;
      default:
        return null;
    }
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key, this.fillColor}) : super(key: key);

  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.passwordInput != current.passwordInput ||
          previous.passwordVisibility != current.passwordVisibility,
      builder: (context, state) {
        final bloc = context.read<LoginBloc>();
        return MyTextInput(
          isRequired: true,
          label: S.of(context).password,
          obscureText: !state.passwordVisibility,
          initialValue: state.passwordInput.value,
          keyboardType: TextInputType.text,
          onChanged: (password) {
            context.read<LoginBloc>().add(LoginPasswordChanged(password));
          },
          onSubmitted: (_) {
            context.read<LoginBloc>().add(const LoginSubmitted());
          },
          suffixIcon: IconButton(
            icon: Icon(
              state.passwordVisibility
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () => bloc.add(const PasswordVisibilityToggled()),
          ),
          fillColor: fillColor,
          errorText: _handleErrorText(context, state),
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, LoginState state) {
    if (!state.passwordInput.invalid) return null;
    switch (state.passwordInput.error) {
      case PasswordInputValidationError.empty:
        return S.of(context).pls_input_your_password;
      default:
        return null;
    }
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const CircularProgressIndicator();
        }
        return MyButton(
          title: S.of(context).login,
          onPressed: () => _onPressed(context),
        );
      },
    );
  }

  void _onPressed(BuildContext context) {
    FocusScope.of(context).unfocus();
    context.read<LoginBloc>().add(const LoginSubmitted());
  }
}
