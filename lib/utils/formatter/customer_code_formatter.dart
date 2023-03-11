import 'package:flutter/services.dart';

class CustomerCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (oldValue.text.contains('-') && !newValue.text.contains('-')) {
        if (newValue.text.length == 3) {
          final text = newValue.text.substring(0, 2);
          return TextEditingValue(
            text: text,
            selection:
                TextSelection.collapsed(offset: newValue.selection.end - 1),
          );
        } else {
          final head = newValue.text.substring(0, 3);
          final text =
              newValue.text.length > 3 ? newValue.text.substring(3) : '';
          return TextEditingValue(
            text: '$head-$text',
            selection:
                TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
        }
      }

      if (newValue.text.length >= 3 && !newValue.text.contains('-')) {
        final head = newValue.text.substring(0, 3);
        final text = newValue.text.length > 3 ? newValue.text.substring(3) : '';
        return TextEditingValue(
          text: '$head-$text',
          selection:
              TextSelection.collapsed(offset: newValue.selection.end + 1),
        );
      }
    }
    return newValue;
  }
}
