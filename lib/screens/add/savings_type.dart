import 'package:buddy_save/components/fragments/inputs/app_date_input.dart';
import 'package:buddy_save/components/fragments/inputs/app_radio_input.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/layouts/banner/buddy_save.dart';
import 'package:buddy_save/components/layouts/scaffolds/form_scaffold.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/models/enums/type_state.dart';
import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/utils/validators.dart';
import 'package:buddy_save/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../States/action_state.dart';
import '../../components/fragments/cards/savings_type.dart';

class BuddySavingsType extends StatelessWidget {
  BuddySavingsType({Key? key}) : super(key: key);
  final header = BuddyTextStyle.medium.copyWith(
    color: Colors.black,
    fontSize: 47,
  );
  bool _isRadioSelected = false;

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
          "How do you want to save?",
          style: header,
        ),
        Row(
          children: [
            Expanded(
              child: ValueListenableBuilder<TypeState>(
                valueListenable: action.savingsType,
                builder: (ctx, value, __) => BuddySavingsCard(
                  title: "Automatic",
                  onTap: () {
                    action.savingsType.value = TypeState.Automatic;
                  },
                  selected: value == TypeState.Automatic,
                  description: "I will like to be debited automatically",
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<TypeState>(
                valueListenable: action.savingsType,
                builder: (ctx, value, __) => BuddySavingsCard(
                  title: "Manual",
                  selected: value == TypeState.Manual,
                  onTap: () {
                    action.savingsType.value = TypeState.Manual;
                  },
                  description: "I will initaiate debit manually every time.",
                ),
              ),
            )
          ],
        ),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyText(
          "What is your savings frequency?",
          style: header,
        ),
        ValueListenableBuilder<String>(
          valueListenable: action.frequencey,
          builder: (ctx, value, __) => BuddyRadioButton<String>(
            label: 'Daily',
            value: "Daily",
            groupValue: value,
            onChanged: (newValue) {
              action.frequencey.value = newValue;
            },
          ),
        ),
        const BuddySizedBox(
          height: 0.50,
        ),
        ValueListenableBuilder<String>(
          valueListenable: action.frequencey,
          builder: (ctx, value, __) => BuddyRadioButton<String>(
            label: 'Weekly',
            value: 'Weekly',
            groupValue: value,
            onChanged: (newValue) {
              action.frequencey.value = newValue;
            },
          ),
        ),
        const BuddySizedBox(
          height: 0.5,
        ),
        ValueListenableBuilder<String>(
          valueListenable: action.frequencey,
          builder: (ctx, value, __) => BuddyRadioButton<String>(
            label: 'Monthly',
            value: 'Monthly',
            groupValue: value,
            onChanged: (newValue) {
              action.frequencey.value = newValue;
            },
          ),
        ),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyText(
          "When do you want to start saving?",
          style: header,
        ),
        BuddyDateInput(
          action.startDate,
          validator: BuddyValidators.required,
          hintText: 'Choose date',
        ),
      ],
      onSubmit: () {
        Navigator.pushNamed(
          context,
          BuddyRoutes.duration,
        );
      },
      btnText: "Next",
    );
  }
}
