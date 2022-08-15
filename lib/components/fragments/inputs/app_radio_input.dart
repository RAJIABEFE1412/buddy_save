import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BuddyRadioButton<T> extends StatelessWidget{
  const BuddyRadioButton({
    Key? key,
    required this.label,

    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;

  final T groupValue;
  final T  value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: <Widget>[
          Radio<T>(
              groupValue: groupValue,
              value: value,
              onChanged: (T? newValue) {
                onChanged(newValue!);
              }),
          BuddyText(
            label,
            style: BuddyTextStyle.light.copyWith(
              fontSize: 52,
            ),
          ),
        ],

    );
  }
}
