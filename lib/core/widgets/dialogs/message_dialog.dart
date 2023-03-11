import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {
  const MessageDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.icon,
    required this.color,
    this.iconSize = 70,
  }) : super(key: key);

  final String? title;
  final String message;
  final Widget icon;
  final Color color;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    const borderRadius = 16.0;
    return SafeArea(
      child: Dialog(
        insetPadding: const EdgeInsets.all(24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Wrapper(
          maxWidth: appSmallMaxWidth,
          center: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(borderRadius),
                ),
                child: Container(
                  color: color,
                  height: 150,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: icon,
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (title != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextWidget(
                            title,
                            textAlign: TextAlign.center,
                            bold: true,
                            size: 16,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16.0,
                        ),
                        child: TextWidget(
                          message,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // const SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: _CloseButton(color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: TextWidget(
        S.of(context).button_close,
        primary: true,
      ),
    );
  }
}
