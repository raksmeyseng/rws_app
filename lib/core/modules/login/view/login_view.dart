import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rws_app/core/modules/login/bloc/login_bloc.dart';
import 'package:rws_app/core/modules/login/models/password_input.dart';
import 'package:rws_app/core/modules/login/models/username_input.dart';
import 'package:rws_app/core/modules/login/widgets/app_logo.dart';
import 'package:rws_app/core/widgets/my_button.dart';
import 'package:rws_app/core/widgets/my_text_input.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/toggle_theme_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
                        _UserNameInput(
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
                        const SizedBox(height: 32),
                        const _SignInWithAppleId(),
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

class _UserNameInput extends StatelessWidget {
  const _UserNameInput({Key? key, this.fillColor}) : super(key: key);

  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.userNameInput != current.userNameInput,
      builder: (context, state) {
        return MyTextInput(
          isRequired: true,
          label: S.of(context).user_name,
          initialValue: state.userNameInput.value,
          keyboardType: TextInputType.emailAddress,
          onChanged: (username) {
            context.read<LoginBloc>().add(LoginUserNameChanged(username));
          },
          fillColor: fillColor,
          errorText: _handleErrorText(context, state),
        );
      },
    );
  }

  String? _handleErrorText(BuildContext context, LoginState state) {
    if (!state.userNameInput.invalid) return null;
    switch (state.userNameInput.error) {
      case UserNameInputValidationError.empty:
        return S.of(context).pls_input_user_name;
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

class _SignInWithAppleId extends StatelessWidget{
  const _SignInWithAppleId({Key? key}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return SignInWithAppleButton(
          onPressed: () async {
            final credential = await SignInWithApple.getAppleIDCredential(
              scopes: [
                AppleIDAuthorizationScopes.email,
                AppleIDAuthorizationScopes.fullName,
              ],
            );

            print(credential);

          // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
          // after they have been validated with Apple (see `Integration` section for more information on how to do this)
        },
      );
    }else{
      return const SizedBox(height: 32);
    }
    
  }


}
