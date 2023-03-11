import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';

class MySimpleDialog extends StatelessWidget {
  const MySimpleDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Wrapper(
        center: false,
        maxWidth: appSmallMaxWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Theme.of(context).primaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 24.0,
                      ),
                      child: TextWidget(
                        title.toUpperCase(),
                        color: Colors.white,
                      ),
                    ),
                    const _ButtonClose(),
                  ],
                ),
              ),
              Flexible(child: content),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonClose extends StatelessWidget {
  const _ButtonClose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            color: Colors.white,
            iconSize: 20,
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
