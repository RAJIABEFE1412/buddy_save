import 'package:buddy_save/models/podos/savings_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/typography/app_text.dart';

// import 'package:buddy_save/state/loan/loan_state.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/extensions.dart';

class SummaryCard extends StatelessWidget {
  final SavingModel data;

  const SummaryCard({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(scaler.fontSizer.sp(20)),
        border: Border.all(
          color: BuddyColors.grayBorder,
        ),
      ),
      padding: scaler.insets.symmetric(
        horizontal: 3,
        vertical: 1.8,
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FlexColumnWidth(7),
          1: FlexColumnWidth(.5),
          2: FlexColumnWidth(7),
        },
        children: [
          TableRow(
            children: [
              BuddyText(
                "Title",
                style: BuddyTextStyle.light.copyWith(fontSize: 41),
              ),
              Offstage(),
              BuddyText(
                "Number of Buddies",
                style: BuddyTextStyle.light.copyWith(fontSize: 41),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          TableRow(
            children: const BuddySizedBox(height: .8) * 3,
          ),
          TableRow(
            children: [
              BuddyText(
                "${data.title }",
                style: BuddyTextStyle.bold.copyWith(fontSize: 60),
              ),
              Offstage(),
              BuddyText(
                "${data.totalFriends}",
                style: BuddyTextStyle.bold.copyWith(fontSize: 60),
                textAlign: TextAlign.end,
              ),
            ],
          ),
          TableRow(
            children: const BuddySizedBox(height: 2.5) * 3,
          ),
          TableRow(
            children: [
              BuddyText(
                "Amount",
                style: BuddyTextStyle.light.copyWith(fontSize: 41),
              ),
              Offstage(),
              Offstage(),
            ],
          ),
          TableRow(
            children: const BuddySizedBox(height: .8) * 3,
          ),
          TableRow(
            children: [
              BuddyText(
                "${data.amount}",
                style: BuddyTextStyle.bold.copyWith(fontSize: 60),
              ),
              Offstage(),
              Offstage(),
            ],
          ),
        ],
      ),
    );
  }
}
