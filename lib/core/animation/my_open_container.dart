import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MyOpenContainer<MyBloc> extends StatelessWidget {
  const MyOpenContainer({
    super.key,
    required this.openBuilder,
    required this.closedBuilder,
  });

  final Widget Function(BuildContext context, VoidCallback openContainer)
      openBuilder;
  final Widget Function(BuildContext context, VoidCallback openContainer)
      closedBuilder;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openColor: Theme.of(context).cardColor,
      closedColor: Theme.of(context).cardColor,
      tappable: false,
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      openBuilder: openBuilder,
      closedBuilder: closedBuilder,
    );
  }
}
