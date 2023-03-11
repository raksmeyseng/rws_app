import 'package:rws_app/core/models/currency_model.dart';
import 'package:rws_app/utils/extensions/double_extension.dart';
import 'package:flutter/services.dart';

class AmountFormatter extends TextInputFormatter {
  AmountFormatter({
    required this.currency,
    this.digitLimit = 10,
  });

  final CurrencyModel currency;

  /// Limit digit not include separator or after decimal place
  final int digitLimit;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final cleanText = newValue.text.trim().replaceAll(',', '');

    if (cleanText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    if (!currency.format.contains('.')) {
      if (cleanText.length > digitLimit) {
        return oldValue;
      }
      final pureText = newValue.text.trim().replaceAll(',', '');
      final value = (double.tryParse(pureText) ?? .0).format();
      return TextEditingValue(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }

    if (currency.format.contains('.')) {
      final decimalLength =
          currency.format.split(';').first.split('.').last.length;

      if (!cleanText.contains('.') && cleanText.length > digitLimit) {
        return oldValue;
      }

      if (!newValue.text.contains('.')) {
        final pureText = newValue.text.trim().replaceAll(',', '');
        final value = (double.tryParse(pureText) ?? .0).format();
        return TextEditingValue(
          text: value,
          selection: TextSelection.collapsed(offset: value.length),
        );
      }
      if (newValue.text.allMatches('.').length > 1) {
        return oldValue;
      }
      if (newValue.text.trim().endsWith('.')) {
        return newValue;
      }
      if (newValue.text.contains('.') &&
          newValue.text.split('.').last.length > decimalLength) {
        return oldValue;
      }
      if (oldValue.text.trim().contains('.')) {
        final pureText = newValue.text.trim().replaceAll(',', '');
        final value = (double.tryParse(pureText) ?? .0).format(currency.format);
        final values = value.split('.');
        values[1] = pureText.split('.').last;
        final text = values.join('.');
        return TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
      }
    }

    return newValue;
  }
}
