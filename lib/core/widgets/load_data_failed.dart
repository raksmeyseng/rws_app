import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/widgets/header_icon.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoadDataFailed extends StatelessWidget {
  const LoadDataFailed({Key? key, this.onRetry}) : super(key: key);

  final void Function(BuildContext context)? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderIcon(
            iconPath: AssetPath.iconError,
            color: Theme.of(context).dividerColor,
          ),
          const SizedBox(height: 24.0),
          TextWidget(
            S.of(context).load_data_failed,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24.0),
          if (onRetry != null)
            IconButton(
              onPressed: () => onRetry!(context),
              color: Theme.of(context).primaryColor,
              iconSize: 35,
              icon: const Icon(Icons.refresh_outlined),
            ),
        ],
      ),
    );
  }
}
