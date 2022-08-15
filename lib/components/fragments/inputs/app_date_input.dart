import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';
import 'package:buddy_save/utils/intl_formatter.dart';
import 'package:buddy_save/utils/typedefs.dart';

class BuddyDateInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final OnValidate<String?>? validator;
  final DateTime? lastDate;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final bool isEnabled;
  final bool formatDate;

  BuddyDateInput(
    this.controller, {
    this.hintText = "Date",
    this.validator,
    this.isEnabled = true,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.formatDate = true,
  }) : assert(controller != null);

  @override
  State<StatefulWidget> createState() => _BuddyDateInputState();
}

class _BuddyDateInputState extends State<BuddyDateInput> {
  late TextEditingController _localCtrl;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null &&
        widget.controller.text != null &&
        widget.controller.text.isNotEmpty) {
      _localCtrl = TextEditingController(text: widget.controller.text);
    } else {
      _localCtrl = TextEditingController();
    }
  }

@override
void didUpdateWidget (BuddyDateInput oldWidget) {
  super.didUpdateWidget(oldWidget);
    if (widget.controller != null &&
        widget.controller.text != null &&
        widget.controller.text.isNotEmpty) {
      _localCtrl = TextEditingController(text: widget.controller.text);
    } else {
      _localCtrl = TextEditingController();
    }
  
}
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: widget.isEnabled
              ? () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final date = await showDatePicker(
                    context: context,
                    initialDate: widget.initialDate ?? DateTime.now(),
                    firstDate: widget.firstDate ?? DateTime(1000),
                    lastDate: widget.lastDate ?? DateTime(3000),
                  );
                  if (date != null) {
                    widget.controller.text = date.toIso8601String();
                    _localCtrl.text = BuddyFormatter.formatDate(
                      date.toIso8601String(),
                      format: "dd-MMM-yyyy",
                    );
                  }
                }
              : null,
          child: BuddyTextField(
            controller: _localCtrl,
            hintText: widget.hintText,
            validator: widget.validator,
            isEnabled: false,
            suffixIcon: Icon(Icons.calendar_today_outlined),
          ),
        );
      },
    );
  }
}
