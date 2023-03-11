import 'package:flutter/material.dart';

class TableElement extends StatelessWidget {
  const TableElement(
    this.value, {
    Key? key,
    // ignore: unused_element
    this.flex = 1,
    this.width,
  }) : super(key: key);

  final Widget value;
  final int flex;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: value,
        ),
      );
    }
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: value,
      ),
    );
  }
}
