import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    Key? key,
    required this.iconPath,
    this.color,
    this.size = 40,
  }) : super(key: key);

  final String iconPath;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: (color ?? Theme.of(context).primaryColor).withOpacity(.1),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Image.asset(
            iconPath,
            width: size,
            height: size,
            color: color ?? Theme.of(context).primaryColor,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
