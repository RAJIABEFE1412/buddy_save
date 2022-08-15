import 'package:buddy_save/components/fragments/buttons/app_button.dart';
import 'package:buddy_save/components/fragments/cards/loan_summary_card.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/fragments/state/app_empty_state.dart';
import 'package:buddy_save/components/layouts/banner/buddy_save.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/models/podos/savings_model.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/style/style.dart';
import 'package:buddy_save/values/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../States/action_state.dart';
import '../../components/fragments/cards/summary_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final action = context.watch<ActionState>();
    return Scaffold(
      backgroundColor: const Color(0xFFf5f6fd),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ValueListenableBuilder<List<SavingModel>>(
          valueListenable: action.savings,
          builder: (BuildContext context, value, Widget? child) {
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (ctx, index) => (index == 0)
                  ? const BuddySaveBanner()
                  : value.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                          child: SummaryCard(data: value[index - 1]),
                        )
                      : BuddySizedBox(
                          height: 50,
                          width: 100,
                          child: BuddyEmptyState(
                            message: "There's no savings yet",
                            subMessage:
                                "Kindly strt a new savings to get tour summaries here!",
                          ),
                        ),
            );
          },
        ),
      ),
      persistentFooterButtons: [
        BuddyButton(
            text: "New Buddy Savings",
            onPressed: () {
              Navigator.pushNamed(
                context,
                BuddyRoutes.titleInfo,
              );
            }),
      ],
    );
  }
}
