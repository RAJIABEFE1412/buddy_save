
import 'package:buddy_save/components/typography/button_text.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/dimensions.dart';
import 'package:buddy_save/utils/typedefs.dart';
import 'package:flutter/material.dart';

class BuddyButton extends StatelessWidget {
  final OnPressed? onPressed;
  final Color color;
  final Color? disabledColor;
  final Color textColor;
  final String text;
  final String? secondText;
  final bool isDense;
  final bool isFitted;
  final bool isBold;
  final bool withBorder;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double fontSize;
  final double cornerRadius;
  final bool _rich;

  BuddyButton({
    required this.text,
    required this.onPressed,
    this.color = BuddyColors.primary,
    this.textColor = BuddyColors.white,
    this.disabledColor,
    this.isDense = false,
    this.isBold = false,
    this.isFitted = true,
    this.withBorder = false,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontSize = 40,
    this.cornerRadius = 30,
    Key? key,
  })  : this.secondText = null,
        this._rich = false,
        super(key: key);

  BuddyButton.rich({
    required this.text,
    required this.onPressed,
    required this.secondText,
    this.color = BuddyColors.primary,
    this.textColor = BuddyColors.white,
    this.disabledColor,
    this.isDense = false,
    this.isBold = false,
    this.isFitted = true,
    this.withBorder = false,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontSize = 40,
    this.cornerRadius = 30,
    Key? key,
  })  : this._rich = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = BuddyScaleUtil(context);
    return FlatButton(
      disabledColor: disabledColor ?? color.withOpacity(.5),
      padding: scaler.insets.symmetric(
        vertical: verticalPadding ?? (isDense ? 2 : 2.5),
        horizontal: horizontalPadding ?? 8,
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          scaler.fontSizer.sp(cornerRadius),
        ),
        side: BorderSide(
            color: withBorder ? BuddyColors.primary : color, width: 1.0),
      ),
      child: this._rich
          ? RichText(
              text: TextSpan(
                text: "$text ",
                children: [
                  TextSpan(
                    text: "$secondText",
                    style: BuddyTextStyle.bold.copyWith(
                      fontSize: scaler.fontSizer.sp(52),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
                style: BuddyTextStyle.medium.copyWith(
                  fontSize: scaler.fontSizer.sp(45),
                  color: BuddyColors.black,
                ),
              ),
            )
          : ButtonText(
              text,
              textColor:
                  onPressed != null ? textColor : textColor.withOpacity(.4),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize,
              fitted: isFitted,
            ),
      onPressed: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(
                new FocusNode(),
              );
              onPressed!();
            }
          : null,
    );
  }
}
