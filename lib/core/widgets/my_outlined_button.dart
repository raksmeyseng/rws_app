import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.expanded = true,
    this.maxWidth,
    this.color,
    this.dense = false,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;
  final bool expanded;
  final double? maxWidth;
  final Color? color;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final cl = onPressed != null
        ? color ?? Theme.of(context).primaryColor
        : Theme.of(context).dividerColor.withOpacity(.5);
    final borderRadius = dense ? 10.0 : 14.0;
    return Wrapper(
      maxWidth: maxWidth ?? appContentMaxWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: expanded ? double.infinity : null,
          height: dense ? appButtonHeightDense : appButtonHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: cl),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              highlightColor: cl.withOpacity(.1),
              splashColor: cl.withOpacity(.2),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: TextWidget(
                    title.toUpperCase(),
                    color: cl,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
