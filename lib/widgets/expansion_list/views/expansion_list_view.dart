import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/widgets/expansion_list/models/expansion_config.dart';
import 'package:rws_app/widgets/expansion_list/models/expansion_item.dart';
import 'package:rws_app/widgets/xexpansion_tile.dart';
import 'package:flutter/material.dart';

class ExpansionListView extends StatelessWidget {
  const ExpansionListView(
    this.initialItems, {
    Key? key,
    required this.onExpansionChanged,
    required this.config,
    required this.onClicked,
    required this.onChecked,
    this.randomItemKey = false,
    this.shrinkWrap = false,
    this.physics,
    this.padding,
    required this.isChecked,
  }) : super(key: key);

  final List<ExpansionItem> initialItems;
  final void Function(ExpansionItem node, bool expanded) onExpansionChanged;
  final bool randomItemKey;

  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final ExpansionConfig config;
  final void Function(ExpansionItem) onClicked;
  final void Function(ExpansionItem node, bool checked) onChecked;
  final bool Function(ExpansionItem node) isChecked;

  @override
  Widget build(BuildContext context) {
    final roots = initialItems.getRoots(config.rootParentId);

    return ListView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      itemBuilder: (context, index) {
        return _ExpansionListItem(
          initialItems,
          roots[index],
          config: config,
          onClicked: onClicked,
          onExpansionChanged: onExpansionChanged,
          onChecked: onChecked,
          isChecked: isChecked,
        );
      },
      itemCount: roots.length,
    );
  }
}

class _ExpansionListItem extends StatelessWidget {
  const _ExpansionListItem(
    this.items,
    this.node, {
    Key? key,
    required this.onExpansionChanged,
    required this.config,
    required this.onClicked,
    required this.onChecked,
    required this.isChecked,
  }) : super(key: key);

  final List<ExpansionItem> items;
  final ExpansionItem node;
  final void Function(ExpansionItem node, bool expanded) onExpansionChanged;
  final ExpansionConfig config;
  final void Function(ExpansionItem) onClicked;
  final void Function(ExpansionItem node, bool checked) onChecked;
  final bool Function(ExpansionItem node) isChecked;

  @override
  Widget build(BuildContext context) {
    return _buildTile(context, node);
  }

  Widget _buildTile(BuildContext context, ExpansionItem node) {
    final children = items.getChildrenOf(node.getId());
    if (children.isEmpty) {
      return Material(
        key: PageStorageKey<int>(node.getId()),
        color: Colors.transparent,
        child: InkWell(
          onTap: node.getId() <= 0 ? null : () => onClicked(node),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: ListTile(
              title: TextWidget(node.getTitle(context)),
              leading: Checkbox(
                value: isChecked(node),
                onChanged: (checked) => onChecked(node, checked!),
              ),
            ),
          ),
        ),
      );
    }

    final List<Widget> expansionChildren = [];
    for (var child in children) {
      expansionChildren.add(_buildTile(context, child));
    }

    return XExpansionTile(
      key: Key(node.getId().toString()),
      childrenPadding: const EdgeInsets.only(left: 24.0),
      onLongPress: () {
        if (node.getId() > 0) {
          onClicked(node);
        }
      },
      title: ListTile(
        title: TextWidget(node.getTitle(context)),
        leading: Checkbox(
          value: isChecked(node),
          onChanged: (checked) => onChecked(node, checked!),
        ),
      ),
      initiallyExpanded: node.expanded,
      onExpansionChanged: (expanded) => onExpansionChanged(node, expanded),
      children: expansionChildren,
    );
  }
}
