import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/extensions.dart';
import 'package:buddy_save/utils/typedefs.dart';
import 'package:flutter/material.dart';

import 'package:buddy_save/components/typography/app_text.dart';

import '../../../style/colors.dart';

class BuddySavingsCard extends StatelessWidget {
  const BuddySavingsCard({
    Key? key,
    required this.title,
    required this.selected,
    required this.description,
    required this.onTap,
  }) : super(key: key);
  final String title, description;
  final bool selected;
  final OnPressed onTap;
  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Padding(
      padding: scaler.insets.symmetric(
        vertical: 2.0,
        horizontal: 1.0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: selected ? 1.5 : 0.25,
                style: BorderStyle.solid ,
                color:
                    selected ? BuddyColors.primary : const Color(0xFF000000)),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                6.0,
              ),
            ),
          ),
          padding: scaler.insets.symmetric(
            vertical: 1.75,
            horizontal: 3.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BuddyText(
                title,
                style: BuddyTextStyle.medium.copyWith(
                  fontSize: 54,
                ),
              ),
              const BuddySizedBox(
                height: 0.85,
              ),
              BuddyText(
                description,
                style: BuddyTextStyle.light
                    .copyWith(fontSize: 36, color: BuddyColors.lightGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
