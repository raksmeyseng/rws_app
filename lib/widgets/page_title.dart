import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextWidget(
          title,
          bold: true,
          size: 22,
        ),
        if (subtitle != null) TextWidget(subtitle),
      ],
    );
  }
}
