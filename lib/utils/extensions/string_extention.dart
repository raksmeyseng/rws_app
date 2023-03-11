import 'package:rws_app/utils/helpers/color_helper.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  Color toColor() {
    try {
      return Color(ColorHelper.fromHexString(this));
    } catch (e) {
      return Colors.white;
    }
  }
}
