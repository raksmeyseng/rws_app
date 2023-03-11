import 'package:rws_app/constants/asset_path.dart';
import 'package:rws_app/core/widgets/caption_widget.dart';
import 'package:rws_app/core/widgets/header_icon.dart';
import 'package:rws_app/translation/generated/l10n.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderIcon(
            iconPath: AssetPath.iconFolder,
            color: Theme.of(context).dividerColor,
          ),
          const SizedBox(height: 16.0),
          CaptionWidget(S.of(context).empty_data),
        ],
      ),
    );
  }
}
