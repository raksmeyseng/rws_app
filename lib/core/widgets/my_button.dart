import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:rws_app/core/widgets/wrapper.dart';
import 'package:rws_app/utils/common_utils.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.title,
    this.icon,
    required this.onPressed,
    this.expanded = true,
    this.maxWidth,
    this.color,
    this.dense = false,
    this.boldTitle = false,
  }) : super(key: key);

  final String title;
  final Widget? icon;
  final void Function()? onPressed;
  final bool expanded;
  final double? maxWidth;
  final Color? color;
  final bool dense;
  final bool boldTitle;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      maxWidth: maxWidth ?? appContentMaxWidth,
      center: false,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: expanded ? double.infinity : null,
          height: dense ? appButtonHeightDense : appButtonHeight,
          color: onPressed != null
              ? color ?? Theme.of(context).primaryColor
              : Theme.of(context).dividerColor.withOpacity(.5),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (icon != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: icon,
                        ),
                      TextWidget(
                        title.toUpperCase(),
                        color: Colors.white,
                        bold: boldTitle,
                      ),
                    ],
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
