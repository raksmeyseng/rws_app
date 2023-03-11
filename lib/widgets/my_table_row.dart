import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:flutter/material.dart';

class MyTableRow extends StatelessWidget {
  const MyTableRow({
    super.key,
    this.onHover,
    this.onTap,
    required this.children,
  });

  final void Function(bool value)? onHover;
  final void Function()? onTap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      padding: EdgeInsets.zero,
      onHover: onHover,
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(children: children),
        ),
      ),
    );
  }
}
