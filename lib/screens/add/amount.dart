import 'package:buddy_save/States/action_state.dart';
import 'package:buddy_save/utils/validators.dart';
import 'package:provider/provider.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/layouts/banner/buddy_save.dart';
import 'package:buddy_save/components/layouts/scaffolds/form_scaffold.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/values/routes.dart';
import 'package:flutter/material.dart';

class BuddyAmount extends StatelessWidget {
  BuddyAmount({Key? key}) : super(key: key);
  final header = BuddyTextStyle.medium.copyWith(
    color: Colors.black,
    fontSize: 47,
  );

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ActionState>();
    return FormScaffold.withAppbar(
      title: 'Buddy Savings',
      fields: [
        const BuddySaveBanner(),
        const BuddySizedBox(
          height: 2.0,
        ),
        BuddyText(
          "How much do you want to save in ${model.duration.value}",
          style: header,
        ),
        BuddyTextField.amount(
          hintText: '',
          controller: model.targetAmount,
          validator: BuddyValidators.amountValidator,
        ),
       
        // BuddyText(
        //   "When do you want to start saving?",
        //   style: header,
        // ),
        //  BuddyDateInput(
        //   TextEditingController(),
        //   hintText: '',
        // ),
      // Spacer(),
        const BuddySizedBox(
          height: 36.5,
        ),
      ],
      onSubmit: () {
        Navigator.pushNamed(
          context,
          BuddyRoutes.finalize,
        );
      },
      btnText: "Next",
    );
  }
}
