import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:rws_app/utils/helpers/version_helper.dart';
import 'package:flutter/material.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    Key? key,
    required this.message,
    this.forceUpdate = false,
  }) : super(key: key);

  final String message;
  final bool forceUpdate;

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
          // maxWidth: appSmallMaxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(borderRadius),
                ),
                child: Container(
                  color: Theme.of(context).primaryColor,
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetPath.imgUpdate,
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        TextWidget(
                          S.of(context).title_version_update,
                          bold: true,
                          size: 20,
                        ),
                        const SizedBox(height: 10),
                        TextWidget(message),
                      ],
                    ),
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
                      if (!forceUpdate) ...[
                        _NoButton(title: S.of(context).button_no_thanks),
                        const SizedBox(width: 16.0),
                      ],
                      _YesButton(
                        title: S.of(context).button_update,
                        color: Theme.of(context).primaryColor,
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
      onPressed: () {
        VersionHelper.openExternalStore();
      },
    );
  }
}
