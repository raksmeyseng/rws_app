import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/modules/app/bloc/app_bloc.dart';
import 'package:rws_app/core/modules/login/widgets/app_logo.dart';
import 'package:rws_app/core/widgets/my_outlined_button.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStartedFailedView extends StatelessWidget {
  const AppStartedFailedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          const _Header(),
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                top: false,
                bottom: false,
                child: Wrapper(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 16.0),
                        const _IconFailed(),
                        TextWidget(
                          S.of(context).title_error,
                          bold: true,
                          size: 18,
                          color: AppColor.white,
                        ),
                        const SizedBox(height: 30.0),
                        SizedBox(
                          width: double.infinity,
                          child: TextWidget(
                            S.of(context).app_load_config_failed,
                            textAlign: TextAlign.start,
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Wrapper(child: _RetryButton()),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Wrapper(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              const AppLogo(size: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextWidget(
                  S.of(context).appName,
                  bold: true,
                  color: AppColor.white,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconFailed extends StatelessWidget {
  const _IconFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Image.asset(
          AssetPath.imgTechnicalIssue,
          height: 120,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _RetryButton extends StatelessWidget {
  const _RetryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MyOutlinedButton(
        title: S.of(context).button_retry,
        color: AppColor.white,
        onPressed: () {
          context.read<AppBloc>().add(const AppStarted());
        },
      ),
    );
  }
}
