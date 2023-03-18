import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ThemeItem extends StatefulWidget {
  const ThemeItem({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  final Color backgroundColor;
  final Color foregroundColor;
  final String value;
  final String groupValue;
  final void Function(String?) onChanged;
  final String title;

  @override
  ThemeItemState createState() => ThemeItemState();
}

class ThemeItemState extends State<ThemeItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => widget.onChanged(widget.value),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 65,
                  height: 85,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: widget.foregroundColor,
                        width: 40,
                        height: 10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        width: 40,
                        height: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          TextWidget(widget.title),
        ],
      ),
    );
  }
}
