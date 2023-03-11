import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class FlatCard extends StatelessWidget {
  const FlatCard({
    Key? key,
    required this.child,
    this.onHover,
    this.onTap,
    this.padding = const EdgeInsets.all(16.0),
    this.color,
    this.borderRadius = .0,
    this.elevation = .0,
    this.useInnerSafeArea = false,
    this.side = BorderSide.none,
    this.wrapped = false,
  }) : super(key: key);

  final Widget child;
  final void Function(bool value)? onHover;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final double borderRadius;
  final double elevation;
  final bool useInnerSafeArea;
  final BorderSide side;
  final bool wrapped;

  @override
  Widget build(BuildContext context) {
    Widget myChild = Padding(
      padding: padding,
      child: useInnerSafeArea
          ? SafeArea(
              bottom: false,
              child: child,
            )
          : child,
    );
    if (wrapped) {
      myChild = Wrapper(child: myChild);
    }

    return Card(
      margin: EdgeInsets.zero,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        side: side,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      color: color,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            // highlightColor: color?.withOpacity(.1),
            // splashColor: color?.withOpacity(.2),
            onHover: onHover,
            onTap: onTap,
            child: myChild,
          ),
        ),
      ),
    );
  }
}
