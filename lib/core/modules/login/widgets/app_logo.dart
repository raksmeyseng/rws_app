import 'package:flutter/material.dart';
import 'package:rws_app/config/themes/app_color.dart';
import 'package:rws_app/constants/asset_path.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({Key? key, this.size = 120}) : super(key: key);

  final double size;

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: AppColor.white,
        child: Image.asset(
          AssetPath.imgLogoApp,
          height: widget.size,
          width: widget.size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
