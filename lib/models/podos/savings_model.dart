import 'dart:convert';

import 'package:buddy_save/models/enums/type_state.dart';

class SavingModel {
  final num? amount;
  final int totalFriends;
  final String? relationship;
  final String? title;
  final bool? haveTarget;
  final TypeState? savingsType;
  final String? frequency;
  final String? startDate;
  final String? endDate;
  final String? duration;final bool? lock;
  final double? interest;
  SavingModel({
    this.amount,
    required this.totalFriends,
    this.relationship,
    this.title,
    this.haveTarget,
    this.savingsType,
    this.frequency,this.lock,
    this.startDate,
    this.endDate,
    this.duration,
    this.interest,
  });


  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'totalFriends': totalFriends,
      'relationship': relationship,
      'title': title,
      'lock': lock,
      'haveTarget': haveTarget,
      'savingsType': savingsType,
      'frequency': frequency,
      'startDate': startDate,
      'endDate': endDate,
      'duration': duration,
      'interest': interest,
    };
  }

  factory SavingModel.fromMap(Map<String, dynamic> map) {
    return SavingModel(
      amount: map['amount']?.toDouble(),
      totalFriends: map['totalFriends']?.toInt() ?? 0,
      relationship: map['relationship'],
      title: map['title'],
      haveTarget: map['haveTarget'],
      lock: map['lock'],
      savingsType: map['savingsType'],
      frequency: map['frequency'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      duration: map['duration'],
      interest: map['interest']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SavingModel.fromJson(String source) => SavingModel.fromMap(json.decode(source));
}
