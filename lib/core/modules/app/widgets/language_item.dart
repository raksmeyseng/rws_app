import 'package:rws_app/core/enum/language_enum.dart';
import 'package:rws_app/core/widgets/flat_card.dart';
import 'package:rws_app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    Key? key,
    required this.flag,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final String flag;
  final String title;
  final String subtitle;
  final LanguageEnum value;
  final LanguageEnum groupValue;
  final void Function(LanguageEnum) onChanged;

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      onTap: () => onChanged(value),
      wrapped: true,
      child: Row(
        children: [
          Image.asset(
            flag,
            width: 30,
            height: 30,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16.0),
          TextWidget(title),
          const Spacer(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: groupValue == value
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : const SizedBox(height: 0),
          ),
        ],
      ),
    );
  }
}
