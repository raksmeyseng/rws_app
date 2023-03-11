import 'package:flutter/material.dart';
import 'package:rws_app/core/animation/show_up_transition.dart';
import 'package:rws_app/core/modules/login/widgets/app_logo.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Expanded(
          child: Center(
            child: ShowUpTransition(
              child: AppLogo(size: 130),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
      ],
    );
  }
}
