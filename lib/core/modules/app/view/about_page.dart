import 'package:flutter/material.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/constants/app_constant.dart';
import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/widgets/all_right_reserved.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: TextWidget(
          S.of(context).about_app,
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _Header(),
            SizedBox(height: 16.0),
            _Details(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: AllRightReserved(
                showLogo: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      borderRadius: 48,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AssetPath.imgLogoApp,
          height: 90,
          width: 90,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Application.appBloc.state;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TextWidget(
          AppConstant.appName,
          font: AppConstant.engFontFamily,
          bold: true,
          size: 24,
        ),
        const SizedBox(height: 5.0),
        TextWidget(
          '${S.of(context).version} ${appState.packageInfo?.version} (${appState.packageInfo?.buildNumber})',
        ),
      ],
    );
  }
}
