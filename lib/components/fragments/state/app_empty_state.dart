import 'package:buddy_save/components/fragments/buttons/app_button.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/utils/dimensions.dart';
import 'package:buddy_save/utils/typedefs.dart';
import 'package:flutter/material.dart';

class BuddyEmptyState extends StatelessWidget {
  final String message;
  final String? subMessage;
  final OnPressed? onRetry;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  BuddyEmptyState({
    required this.message,
    this.onRetry,
    this.subMessage,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : assert(message != null);
  @override
  Widget build(BuildContext context) {
    final scaler = BuddyScaleUtil(context);
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Icon(
          Icons.workspaces_outline,
          size: scaler.fontSizer.sp(200),
        ),
        const BuddySizedBox(height: .5),
        Flexible(
          child: BuddyText(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight:
                  subMessage != null ? FontWeight.bold : FontWeight.w300,
            ),
          ),
        ),
        if (subMessage != null) const BuddySizedBox(height: .5),
        if (subMessage != null)
          Flexible(
            child: BuddyText(
              subMessage!,
              textAlign: TextAlign.center,
              style: BuddyTextStyle.light,
            ),
          ),
        if (onRetry != null)
          Flexible(
            child: FittedBox(
              child: BuddyButton(
                text: "Refresh",
                textColor: BuddyColors.purple,
                color: BuddyColors.transparent,
                onPressed: onRetry,
              ),
            ),
          ),
      ],
    );
  }
}
