import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FloatingEvent extends StatelessWidget {
  const FloatingEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.apps_sharp, //icon on Floating action button
      activeIcon: Icons.close, //icon when menu is expanded on button
      backgroundColor: Colors.deepOrangeAccent, //background color of button
      foregroundColor: Colors.white, //font color, icon color in button
      activeBackgroundColor: Colors.deepPurpleAccent, //background color when menu is expanded
      activeForegroundColor: Colors.white,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING'), // action when menu opens
      onClose: () => print('CLOSED'), //action when menu closes
      elevation: 8.0, //shadow elevation of button
      shape: const CircleBorder(), //shape of button
      children: [
        SpeedDialChild( //speed dial child
          child: const Icon(Icons.send),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          label: 'ផ្ញើ',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () => print('Send'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.edit),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          label: 'កែតម្រូវ',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () => print('Edit'),
        ),
        SpeedDialChild(
            child: const Icon(Icons.delete),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'លុប',
            labelStyle: const TextStyle(fontSize: 18.0),
            onTap: () {
              Blurry(
                title:  'Delete',
                description:
                'Do you want to delete this Draft?',
                confirmButtonText:  'Confirm',
                onConfirmButtonPressed: () {
                  print('Delete check!');
                },
                themeColor: Colors.red,
                icon: Icons.delete_outline_rounded,)
                  .show(context);
            }
        ),
      ],
    );
  }
}
