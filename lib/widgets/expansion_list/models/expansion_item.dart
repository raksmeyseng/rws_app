import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ExpansionItem extends Equatable {
  const ExpansionItem({this.expanded = false});

  final bool expanded;

  int getId();
  int getParentId();
  String getTitle(BuildContext context);
  int getLevel();
  int getOrdering();

  ExpansionItem copyWith({bool? expanded});

  @override
  List<Object?> get props => [expanded];
}

extension ExpansionItemListExtension on List<ExpansionItem> {
  List<ExpansionItem> getRoots([int parentId = 0]) {
    return where((x) => x.getParentId() == parentId).toList();
  }

  List<ExpansionItem> getChildrenOf(int parentId) {
    return where((x) => x.getParentId() == parentId).toList();
  }

  ExpansionItem? findById(int id) {
    try {
      return firstWhere((x) => x.getId() == id);
    } catch (e) {
      return null;
    }
  }

  int getIndexById(int id) {
    return indexWhere((x) => x.getId() == id);
  }
}
