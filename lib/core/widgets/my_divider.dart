import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
    this.indent,
    this.endIndent,
    this.color,
  }) : super(key: key);

  final double? indent;
  final double? endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1.5,
      indent: indent,
      endIndent: endIndent,
      color: color ?? Theme.of(context).dividerColor.withOpacity(.1),
    );
  }
}
