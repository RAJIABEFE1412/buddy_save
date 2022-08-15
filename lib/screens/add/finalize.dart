import 'package:buddy_save/States/action_state.dart';
import 'package:buddy_save/components/fragments/buttons/app_button.dart';

import 'package:buddy_save/components/fragments/inputs/app_radio_input.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/layouts/banner/buddy_save.dart';
import 'package:buddy_save/components/layouts/scaffolds/form_scaffold.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/fragments/cards/loan_summary_card.dart';

class BuddyFinalize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final action = context.watch<ActionState>();
    return FormScaffold.withAppbar(
      title: 'Buddy Savings',
      fields: [
        BuddyText(
          "Invite your buddy",
          style: BuddyTextStyle.black.copyWith(
            fontSize: 65,
          ),
        ),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyText(
          "An invite will be sen to any of your buddies you add to his savings plan.",
          style: BuddyTextStyle.light.copyWith(
              fontSize: 44, height: 1.55, color: BuddyColors.lightGrey),
        ),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyCard(),
        const BuddySizedBox(
          height: 2.0,
        ),
        TextButton.icon(
          onPressed: () {
            action.increaseBuddies();
            final snackBar = SnackBar(
              content: BuddyText(
                'New buddy added!',
                style: BuddyTextStyle.bold.copyWith(
                  color: BuddyColors.white,
                ),
              ),
              backgroundColor: BuddyColors.green,
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(
            Icons.add,
          ),
          label: const BuddyText("Add a buddy"),
        ),
      ],
      btnText: "Finalize Savings",
      onSubmit: () {
        action.finalize();
        Navigator.popUntil(
          context,
          ModalRoute.withName(BuddyRoutes.homeScreen),
        );
      },
    );
  }
}
