import 'package:rws_app/core/widgets/dialogs/message_dialog.dart';
import 'package:flutter/material.dart';

class AlertMessageDialog extends StatelessWidget {
  const AlertMessageDialog({
    Key? key,
    this.title,
    required this.message,
    this.icon,
    this.iconSize = 70,
  }) : super(key: key);

  final String? title;
  final String message;
  final Widget? icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return MessageDialog(
      title: title,
      message: message,
      icon: icon ??
          const Icon(
            Icons.info_outline,
            color: Colors.white,
            size: 70,
          ),
      iconSize: iconSize,
      color: Theme.of(context).primaryColor,
    );
  }
}
