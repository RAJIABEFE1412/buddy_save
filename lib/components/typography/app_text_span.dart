import 'package:flutter/material.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/dimensions.dart';
import 'package:buddy_save/style/colors.dart';

class BuddyTextSpan extends StatelessWidget {
  final List<String> messages;
  final double fontSize;
  final TextAlign textAlign;
  final bool forceLineBreak;

  const BuddyTextSpan({
    required this.messages,
    this.textAlign = TextAlign.left,
    this.fontSize = 45,
    this.forceLineBreak = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = BuddyScaleUtil(context);
    return RichText(
      text: TextSpan(
        children: messages.map(
          (message) {
            final embolden = message.startsWith("(BOLD)");
            if (embolden) {
              message = message.substring(6);
            }
            final appendage = !forceLineBreak
                ? ""
                : message == messages.last
                    ? ""
                    : "\n\n";
            return TextSpan(
              text: "$message$appendage",
              style: embolden
                  ? BuddyTextStyle.medium.copyWith(
                      color: BuddyColors.black,
                      fontSize: scaler.fontSizer.sp(fontSize),
                      fontWeight: FontWeight.w900,
                    )
                  : null,
            );
          },
        ).toList(),
        style: BuddyTextStyle.medium.copyWith(
          color: BuddyColors.black,
          fontSize: scaler.fontSizer.sp(fontSize),
          fontWeight: FontWeight.w600,
        ),
      ),
      textAlign: textAlign,
    );
  }
}
