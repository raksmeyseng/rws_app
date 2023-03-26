import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/core/widgets/text_widget.dart';

class AddNewWaterManageSystem extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onPress;
  const AddNewWaterManageSystem({
    Key? key,
    this.title,
    this.icon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPress,
      icon: Icon(
        icon,
        color: AppColor.white,
      ),
      label: TextWidget(
        title!,
        color: AppColor.white,
      ),
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
