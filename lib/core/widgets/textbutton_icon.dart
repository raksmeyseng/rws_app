import 'package:flutter/material.dart';

class AddNewWaterManageSystem extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onPress;
  const AddNewWaterManageSystem({Key? key, this.title, this.icon, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPress,
      icon: Icon(icon, color: Colors.white,),
      label: Text(title!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white,),),
      style: TextButton.styleFrom( //<-- SEE HERE
        side: const BorderSide(width: 1.0, color: Color(0xFF007bff)),
        backgroundColor: const Color(0xFF007BFF),
      ),
    );
  }
}
