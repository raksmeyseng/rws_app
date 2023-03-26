import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class MyTaskModel extends Equatable {
  const MyTaskModel({
    required this.name,
    required this.widget,
  });

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'name')
  final Widget widget;

  @override
  List<Object?> get props => [name, widget];
}
