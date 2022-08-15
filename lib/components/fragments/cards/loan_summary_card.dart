import 'package:buddy_save/States/action_state.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/paint/target.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/utils/extensions.dart';
import 'package:buddy_save/utils/intl_formatter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuddyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    final action = context.watch<ActionState>();
    return Container(
      width: scaler.sizer.width,
      // height: scaler.sizer.setHeight(44),
      decoration: BoxDecoration(
        gradient: BuddyColors.primaryGradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const BuddySizedBox(
            height: 2.0,
          ),
          BuddyText(
            "Target amount",
            style: BuddyTextStyle.light.copyWith(
                color: BuddyColors.grayScaffold,
                fontSize: 42,
                fontWeight: FontWeight.w100),
          ),
          const BuddySizedBox(
            height: .75,
          ),
          BuddyText(
            BuddyFormatter.formatCurrency("${action.getData.amount}"),
            style: BuddyTextStyle.bold.copyWith(
              color: BuddyColors.grayScaffold,
              fontSize: 59,
            ),
          ),
          const BuddySizedBox(
            height: .75,
          ),
          Chip(
            backgroundColor: Color.fromARGB(97, 89, 73, 180),
            padding: scaler.insets.symmetric(vertical: 0, horizontal: 1.75),
            label: BuddyText(
              "You are saving with ${action.getData.totalFriends} buddies",
              style: BuddyTextStyle.medium.copyWith(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          const BuddySizedBox(
            height: .75,
          ),
          Padding(
            padding: scaler.insets.only(
              left: 6.0,
              right: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuddyText(
                      "Your target:",
                      style: BuddyTextStyle.light.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const BuddySizedBox(
                      height: .25,
                    ),
                    BuddyText(
                      BuddyFormatter.formatCurrency(
                          "${(action.getData.amount! / (action.getData.totalFriends + 1))}"),
                      style: BuddyTextStyle.medium.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 44,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuddyText(
                      "Other Buddies target:",
                      style: BuddyTextStyle.light.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const BuddySizedBox(
                      height: .25,
                    ),
                    BuddyText(
                      BuddyFormatter.formatCurrency(
                          "${(action.getData.amount! - (action.getData.amount! / (action.getData.totalFriends + 1)))}"),
                      style: BuddyTextStyle.medium.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 44,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const BuddySizedBox(
            height: .75,
          ),
          Padding(
            padding: scaler.insets.only(
              left: 6.0,
              right: 10.0,
            ),
            child: CustomPaint(
              size: Size(scaler.sizer.width, 2),
              painter: TargetPaint(
                friends: action.getData.totalFriends,
              ),
            ),
          ),
          const BuddySizedBox(
            height: 2.75,
          ),
          Padding(
            padding: scaler.insets.only(
              left: 6.0,
              right: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuddyText(
                      "Frequency:",
                      style: BuddyTextStyle.light.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const BuddySizedBox(
                      height: .25,
                    ),
                    BuddyText(
                      "${action.getData.frequency}",
                      style: BuddyTextStyle.medium.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 44,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BuddyText(
                      "Start Date:",
                      style: BuddyTextStyle.light.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const BuddySizedBox(
                      height: .25,
                    ),
                    BuddyText(
                      BuddyFormatter.formatDateShort(
                          "${action.getData.startDate}"),
                      style: BuddyTextStyle.medium.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 44,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const BuddySizedBox(
            height: 2.75,
          ),
          Padding(
            padding: scaler.insets.only(
              left: 6.0,
              right: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuddyText(
                      "End Date:",
                      style: BuddyTextStyle.light.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const BuddySizedBox(
                      height: .25,
                    ),
                    BuddyText(
                      BuddyFormatter.formatDateShort(
                          "${action.getData.endDate}"),
                      style: BuddyTextStyle.medium.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 44,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BuddyText(
                      "Intreset rate:",
                      style: BuddyTextStyle.light.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 42,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    const BuddySizedBox(
                      height: .25,
                    ),
                    BuddyText(
                      "${action.getData.interest} % P.A",
                      style: BuddyTextStyle.medium.copyWith(
                        color: BuddyColors.grayScaffold,
                        fontSize: 44,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const BuddySizedBox(
            height: 1.0,
          ),
          Padding(
            padding: scaler.insets.symmetric(horizontal: 22.0),
            child: ValueListenableBuilder<bool>(
              valueListenable: action.lock,
              builder: (ctx, value, __) => SwitchListTile.adaptive(
                value: value,
                onChanged: (s) {
                  action.lock.value = s;
                },
                title: BuddyText(
                  "Lock Savings",
                  style: BuddyTextStyle.light.copyWith(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
          ),
          const BuddySizedBox(
            height: 1.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(52, 134, 132, 132),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: scaler.insets.symmetric(
              horizontal: 2.0,
              vertical: 0.5,
            ),
            child: BuddyText(
              "You can't withdraw your savings until the set maturity date",
              style: BuddyTextStyle.light.copyWith(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          const BuddySizedBox(
            height: 1.5,
          ),
        ],
      ),
    );
  }
}
