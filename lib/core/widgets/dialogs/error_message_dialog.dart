import 'package:rws_app/core/widgets/dialogs/message_dialog.dart';
import 'package:flutter/material.dart';

class ErrorMessageDialog extends StatelessWidget {
  const ErrorMessageDialog({
    Key? key,
    this.title,
    required this.message,
  }) : super(key: key);

  final String? title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return MessageDialog(
      title: title,
      message: message,
      icon: const Icon(
        Icons.priority_high,
        color: Colors.white,
        size: 70,
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}
