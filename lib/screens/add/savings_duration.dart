import 'package:buddy_save/States/action_state.dart';
import 'package:buddy_save/components/fragments/inputs/app_date_input.dart';
import 'package:buddy_save/components/fragments/inputs/app_dropdown_input.dart';
import 'package:buddy_save/components/fragments/inputs/app_radio_input.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/layouts/banner/buddy_save.dart';
import 'package:buddy_save/components/layouts/scaffolds/form_scaffold.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/models/podos/selection.dart';
import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/utils/validators.dart';
import 'package:buddy_save/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuddySavingsDuration extends StatefulWidget {
  BuddySavingsDuration({Key? key}) : super(key: key);

  @override
  State<BuddySavingsDuration> createState() => _BuddySavingsDurationState();
}

class _BuddySavingsDurationState extends State<BuddySavingsDuration> {
  final header = BuddyTextStyle.medium.copyWith(
    color: Colors.black,
    fontSize: 47,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { 

      final action = context.read<ActionState>();
      action.always();
    });
  }

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
          "How long do you and buddies want to save for?",
          style: header,
        ),
        ValueListenableBuilder<String>(
          valueListenable: action.duration,
          builder: (ctx, duration, ___) => BuddyRadioButton(
            label: '3 Months',
            value: '3 Months',
            groupValue: duration,
            onChanged: (String newValue) {
              action.duration.value = newValue;
              action.always();
            },
          ),
        ),
        const BuddySizedBox(
          height: 1.0,
        ),
        ValueListenableBuilder<String>(
          valueListenable: action.duration,
          builder: (ctx, duration, ___) => BuddyRadioButton<String>(
            label: '6 Months',
            value: '6 Months',
            groupValue: duration,
            onChanged: (String newValue) {
              action.duration.value = newValue;
              action.always();
            },
          ),
        ),
        const BuddySizedBox(
          height: 1.0,
        ),
        ValueListenableBuilder<String>(
          valueListenable: action.duration,
          builder: (ctx, duration, ___) => BuddyRadioButton<String>(
            label: '1 Year',
            value: '1 Year',
            groupValue: duration,
            onChanged: (String newValue) {
              action.duration.value = newValue;
              action.always();
            },
          ),
        ),
        const BuddySizedBox(
          height: 2.0,
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuddyText(
                    "Start Date",
                    style: header,
                  ),
                  BuddyDateInput(
                    action.startDate,
                    isEnabled: false,
                    validator: BuddyValidators.required,
                    hintText: '16/08/2022',
                  ),
                ],
              ),
            ),
            const BuddySizedBox(
              width: 2.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                BuddyText(
                    "End Date",
                    style: header,
                  ),
                  BuddyDateInput(
                    action.endDate,
                    isEnabled: false,
                    validator: BuddyValidators.required,
                    hintText: '16/08/2022',
                  ),
                ],
              ),
            ),
          ],
        ),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyText(
          "Relationship with buddies",
          style: header,
        ),
        BuddyDropdownInput(
          action.relationship,
          hintText: 'Select option',
          validator: BuddyValidators.required,
          items: [
            SelectionData(
              selection: "Family",
              title: "Family",
            ),
            SelectionData(
              selection: "Friends",
              title: "Friends",
            ),
            SelectionData(
              selection: "Others",
              title: "Others",
            ),
          ],
        ),
        const BuddySizedBox(
          height: 10.0,
        ),
      ],
      onSubmit: () {
        Navigator.pushNamed(
          context,
          BuddyRoutes.savingsAmount,
        );
      },
      btnText: "Next",
    );
  }
}
