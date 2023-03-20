import 'package:rws_app/config/routes/app_route.dart';
import 'package:rws_app/config/routes/application.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(builder: (context, size) {
        double divider = size.screenSize.width < appContentMaxWidth ? 2 : 1;
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                // ignore: prefer_single_quotes
                "404",
                font: 'Bayon',
                bold: true,
                size: 150 / divider,
                height: .5,
                // color: Theme.of(context).primaryColor,
                color: AppColor.danger,
              ),
              TextWidget(
                S.of(context).page_not_found,
                font: 'Bayon',
                bold: true,
                size: 40 / divider,
              ),
              const SizedBox(height: 50),
              TextButton(
                onPressed: () {
                  context.goNamed(AppRoute.home);
                  Application.router.refresh();
                },
                child: TextWidget(
                  S.of(context).dashboard,
                  primary: true,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
