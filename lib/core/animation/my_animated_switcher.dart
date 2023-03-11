import 'package:flutter/material.dart';

class MyAnimatedSwitcher extends StatelessWidget {
  const MyAnimatedSwitcher({
    Key? key,
    required this.child,
    this.duration = 400,
  }) : super(key: key);

  final Widget child;

  // Animation duration in milliseconds
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration),
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}
