import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/modules/user_information/view/user_view.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: TextWidget(
          S.of(context).user_name,
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
      body: const UserView(),
    );
  }
}
