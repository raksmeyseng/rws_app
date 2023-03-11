import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    Key? key,
    required this.child,
    this.useSafeArea = true,
    this.backgroundColor,
  }) : super(key: key);

  final Widget child;
  final bool useSafeArea;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).colorScheme.background,
      child: Material(
        color: Colors.transparent,
        child: useSafeArea ? SafeArea(child: child) : child,
      ),
    );
  }
}
