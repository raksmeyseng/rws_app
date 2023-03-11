import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CaptionWidget extends StatelessWidget {
  const CaptionWidget(
    this.value, {
    Key? key,
    this.size,
    this.bold = false,
    this.height,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.underline = false,
    this.softWrap = true,
    this.font,
    this.droppedShadow = false,
    this.copiable = false,
    this.valueToCopy,
  }) : super(key: key);

  final String? value;
  final double? size;
  final bool bold;
  final double? height;
  final TextAlign? textAlign;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final bool underline;
  final bool softWrap;
  final String? font;
  final bool droppedShadow;
  final bool copiable;
  final String? valueToCopy;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall!;
    return TextWidget(
      value,
      color: color ?? style.color,
      size: size ?? style.fontSize,
      bold: bold,
      height: height,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      letterSpacing: letterSpacing,
      underline: underline,
      softWrap: softWrap,
      font: font,
    );
  }
}
