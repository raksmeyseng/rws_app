import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? value;
  final double? size;
  final bool bold;
  final bool primary;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final bool underline;
  final bool softWrap;
  final double? height;
  final String? font;
  final bool droppedShadow;
  final bool copiable;
  final String? valueToCopy;

  const TextWidget(
    this.value, {
    Key? key,
    this.size,
    this.bold = false,
    this.primary = false,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.letterSpacing,
    this.underline = false,
    this.softWrap = true,
    this.height,
    this.font,
    this.droppedShadow = false,
    this.copiable = false,
    this.valueToCopy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : null,
          color: primary ? Theme.of(context).primaryColor : color,
          letterSpacing: letterSpacing,
          decoration: underline ? TextDecoration.underline : null,
          height: height,
          fontFamily: font,
          shadows: droppedShadow
              ? <Shadow>[
                  Shadow(
                    offset: const Offset(1.0, 1.0),
                    blurRadius: 10.0,
                    color: Theme.of(context).cardColor,
                  ),
                ]
              : null,
        );

    if (copiable) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (value != null) {
              copyTextToClipboard(context, valueToCopy ?? value!);
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              color: Colors.grey.withOpacity(.1),
              child: Text(
                value ?? '',
                style: style,
                maxLines: maxLines,
                overflow: overflow,
                textAlign: textAlign,
                softWrap: softWrap,
              ),
            ),
          ),
        ),
      );
    }

    return Text(
      value ?? '',
      style: style,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
