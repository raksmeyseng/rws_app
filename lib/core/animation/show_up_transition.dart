import 'dart:async';

import 'package:flutter/material.dart';

class ShowUpTransition extends StatefulWidget {
  final Widget child;
  final int delay;

  const ShowUpTransition({
    Key? key,
    required this.child,
    this.delay = 0,
  }) : super(key: key);

  @override
  ShowUpTransitionState createState() => ShowUpTransitionState();
}

class ShowUpTransitionState extends State<ShowUpTransition>
    with TickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<Offset> _animOffset;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.delay == 0) {
      _animController.forward();
    } else {
      _timer = Timer(Duration(milliseconds: widget.delay), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
