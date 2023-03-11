import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';

/// Return `true` if user clicked 'yes' else `false`
class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
    required this.title,
    required this.message,
    this.icon = const Icon(
      Icons.priority_high,
      size: 70,
      color: AppColor.white,
    ),
    this.color,
    this.cancelText,
    this.confirmText,
  }) : super(key: key);

  final String title;
  final String message;
  final Widget icon;
  final Color? color;
  final String? cancelText;
  final String? confirmText;

  @override
  Widget build(BuildContext context) {
    const borderRadius = 16.0;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        insetPadding: const EdgeInsets.all(24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Wrapper(
          center: false,
          maxWidth: appSmallMaxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(borderRadius),
                ),
                child: Container(
                  color: color ?? Theme.of(context).primaryColor,
                  height: 150,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: icon,
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (title.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextWidget(title, bold: true, size: 18),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextWidget(message),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _NoButton(
                        title: cancelText,
                      ),
                      const SizedBox(width: 16.0),
                      _YesButton(
                        title: confirmText,
                        color: color,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NoButton extends StatelessWidget {
  const _NoButton({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: TextWidget(
        title ?? S.of(context).button_no,
        primary: true,
      ),
      onPressed: () => Navigator.of(context).pop(false),
    );
  }
}

class _YesButton extends StatelessWidget {
  const _YesButton({
    Key? key,
    this.title,
    this.color,
  }) : super(key: key);

  final String? title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: Theme.of(context).textButtonTheme.style?.copyWith(
            overlayColor: MaterialStatePropertyAll(color?.withOpacity(.1)),
          ),
      child: TextWidget(
        title ?? S.of(context).button_yes,
        color: color ?? Theme.of(context).primaryColor,
      ),
      onPressed: () => Navigator.of(context).pop(true),
    );
  }
}
