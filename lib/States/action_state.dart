import 'dart:developer';

import 'package:buddy_save/models/enums/type_state.dart';
import 'package:buddy_save/models/podos/savings_model.dart';
import 'package:buddy_save/utils/helpers.dart';
import 'package:buddy_save/utils/intl_formatter.dart';
import 'package:flutter/cupertino.dart';

class ActionState with ChangeNotifier {
  // get instance
  static ActionState? _intsance;
  static ActionState get instance => _intsance ??= ActionState();
  final TextEditingController title = TextEditingController();
  final TextEditingController totalFriends = TextEditingController();
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController targetAmount = TextEditingController();
  final TextEditingController relationship = TextEditingController();

  ValueNotifier<String> duration = ValueNotifier("3 Months");

  ValueNotifier<bool> haveTarget = ValueNotifier(true);
  ValueNotifier<bool> lock = ValueNotifier(false);
  ValueNotifier<String> frequencey = ValueNotifier("Daily");
  ValueNotifier<TypeState> savingsType = ValueNotifier(TypeState.Automatic);

  always() {
    endDate.text = getEndDate(duration.value);
    notifyListeners();

  }

  final ValueNotifier<List<SavingModel>> _savings = ValueNotifier([]);

  ValueNotifier<List<SavingModel>> get savings => _savings;

  finalize() {
    _savings.value.add(
      getData,
    );
    clearUp();
  }

 SavingModel get getData {
    return SavingModel(
      totalFriends: int.parse(totalFriends.text),
      amount: extractAmount(targetAmount.text),
      startDate: startDate.text,
      relationship: relationship.text,
      title: title.text,
      interest: 2.5,
      lock: lock.value,
      frequency: frequencey.value,
      endDate: endDate.text,
      haveTarget: haveTarget.value,
      savingsType: savingsType.value,
      duration: duration.value,
    );
  }

  clearUp() {
    title.clear();
    totalFriends.clear();
    startDate.clear();
    targetAmount.clear();
    relationship.clear();
    duration.value = "3 Months";
    haveTarget.value = true;
    lock.value = false;
    frequencey.value = "Daily";
    savingsType.value = TypeState.Automatic;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    totalFriends.dispose();
    startDate.dispose();
    targetAmount.dispose();
    relationship.dispose();
  }

  String getEndDate(String value) {
    int month = 30;
    if (value == "3 Months") {
      month = 90;
    } else if (value == "6 Months") {
      month = 180;
    } else {
      month = 365;
    }

    return BuddyFormatter.formatDateNormal(startDate.text)
        .add(Duration(days: month))
        .toString();
  }

  void increaseBuddies() {
    int total = int.parse(totalFriends.text);
    total++;
    totalFriends.text = total.toString();
    notifyListeners();
  }
}
