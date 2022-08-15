import 'package:flutter/material.dart';
import 'package:buddy_save/style/colors.dart';

final grayInput = InputDecoration(
  filled: true,
  fillColor: BuddyColors.gray,
  hintStyle: TextStyle(
    color: BuddyColors.black.withOpacity(.47),
    fontWeight: FontWeight.normal,
  ),
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: BuddyColors.red,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
          color: BuddyColors.transparent,
          width: 0,
        ),
    borderRadius: BorderRadius.circular(10),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0),
    borderRadius: BorderRadius.circular(10),
  ),
);
