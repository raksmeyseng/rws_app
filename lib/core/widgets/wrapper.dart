import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
    required this.child,
    this.maxWidth = appContentMaxWidth,
    this.center = true,
  }) : super(key: key);

  final Widget child;
  final double maxWidth;
  final bool center;

  @override
  Widget build(BuildContext context) {
    if (!center) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      );
    }
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}
