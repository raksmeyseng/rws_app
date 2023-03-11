import 'package:rws_app/core/widgets/dialogs/message_dialog.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';

class SuccessMessageDialog extends StatelessWidget {
  const SuccessMessageDialog({
    Key? key,
    this.title,
    required this.message,
    this.icon,
  }) : super(key: key);

  final String? title;
  final String message;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return MessageDialog(
      title: title ?? S.of(context).success,
      message: message,
      icon: icon ??
          const Icon(
            Icons.check,
            color: Colors.white,
            size: 70,
          ),
      color: AppColor.success,
    );
  }
}
