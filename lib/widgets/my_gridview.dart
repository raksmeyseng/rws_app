import 'package:flutter/material.dart';

/// WARNING: Don't use this gridview for long list
class MyGridView extends StatelessWidget {
  const MyGridView({
    Key? key,
    required this.itemCount,
    required this.column,
    required this.itemBuilder,
    this.physics,
    this.padding,
    this.shrinkWrap = false,
    this.separatorBuilder,
    this.columnSpacing,
    this.controller,
  }) : super(key: key);

  final int itemCount;
  final int column;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final double? columnSpacing;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    final rows = _getRows();

    return ListView.separated(
      physics: physics,
      controller: controller,
      shrinkWrap: shrinkWrap,
      padding: padding,
      itemBuilder: (_, i) {
        return _buildRow(context, rows[i]);
      },
      separatorBuilder: separatorBuilder ?? (_, __) => Container(),
      itemCount: rows.length,
    );
  }

  List<List<int>> _getRows() {
    final List<List<int>> rows = [];
    for (var i = 0; i < itemCount; i += column) {
      final List<int> items = [];
      for (var j = i; j < column + i; j++) {
        if (j < itemCount) {
          items.add(j);
        }
      }
      rows.add(items);
    }
    return rows;
  }

  Widget _buildRow(BuildContext context, List<int> indexes) {
    final List<Widget> items = [];
    if (indexes.length < column) {
      final count = column - indexes.length;
      for (var i = 0; i < count; i++) {
        indexes.add(-1);
      }
    }
    for (var i in indexes) {
      if (i == -1) {
        items.add(Expanded(child: Container()));
      } else {
        if (columnSpacing != null && items.length < column - 1) {
          items.add(
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: columnSpacing!),
                child: itemBuilder(context, i),
              ),
            ),
          );
        } else {
          items.add(Expanded(child: itemBuilder(context, i)));
        }
      }
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }
}
