import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';

class AutoThemeItem extends StatefulWidget {
  const AutoThemeItem({
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
  AutoThemeItemState createState() => AutoThemeItemState();
}

class AutoThemeItemState extends State<AutoThemeItem> {
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    color: AppColor.backgroundLight,
                    child: CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: widget.backgroundColor,
                        strokeWidth: 0,
                        paintingStyle: PaintingStyle.fill,
                      ),
                      child: Container(
                        width: 65,
                        height: 85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.grey.withOpacity(.3),
                          ),
                        ),
                      ),
                    ),
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

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.stroke,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
