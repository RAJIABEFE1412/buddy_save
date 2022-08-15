import 'package:buddy_save/States/action_state.dart';
import 'package:buddy_save/components/fragments/inputs/app_radio_input.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/layouts/banner/buddy_save.dart';
import 'package:buddy_save/components/layouts/scaffolds/form_scaffold.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/utils/validators.dart';
import 'package:buddy_save/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BuddyTitleInfo extends StatelessWidget {
  BuddyTitleInfo({Key? key}) : super(key: key);
  final header = BuddyTextStyle.medium.copyWith(
    color: Colors.black,
    fontSize: 47,
  );

  @override
  Widget build(BuildContext context) {
    final action = context.watch<ActionState>();
    return FormScaffold.withAppbar(
      title: 'Buddy Savings',
      fields: [
        const BuddySaveBanner(),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyText(
          "Give your buddy savings a title",
          style: header,
        ),
        BuddyTextField(
          hintText: '',
          controller: action.title,
          validator: BuddyValidators.required,
        ),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyText(
          "How many Buddies will be Saving with you?",
          style: header,
        ),
        BuddyTextField(
          hintText: '',
          controller: action.totalFriends,
          validator: BuddyValidators.required,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyText(
          "Do you and your friends have a target?",
          style: header,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: action.haveTarget,
          builder: (ctx, value, __) => BuddyRadioButton(
            label: 'Yes',
            value: true,
            groupValue: value,
            onChanged: (bool newValue) {
              action.haveTarget.value = true;
            },
          ),
        ),
        const BuddySizedBox(
          height: 1.0,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: action.haveTarget,
          builder: (ctx, value, __) => BuddyRadioButton(
            label: 'No',
            value: false,
            groupValue: value,
            onChanged: (bool newValue) {
              action.haveTarget.value = false;
            },
          ),
        ),
      ],
      onSubmit: () {
        Navigator.pushNamed(
          context,
          BuddyRoutes.savingsType,
        );
      },
      btnText: "Next",
    );
  }
}
