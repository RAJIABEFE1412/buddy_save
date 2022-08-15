// import 'dart:async';

import 'dart:async';
import 'package:buddy_save/components/fragments/indicators/dialog_message.dart';
import 'package:buddy_save/components/layouts/scaffolds/dialog_scaffold.dart';
import 'package:buddy_save/models/podos/selection.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/utils/helpers.dart';
import 'package:flutter/material.dart';
// import 'package:buddy_save/components/fragments/indicators/dialog_message.dart';
// import 'package:buddy_save/components/layouts/alerts/loan_alerts.dart';
// import 'package:buddy_save/components/layouts/scaffolds/dialog_scaffold.dart';
import 'package:buddy_save/components/layouts/sheets/app_selection_sheet.dart';
// import 'package:buddy_save/models/podos/loan_models.dart';
// import 'package:buddy_save/models/podos/selection.dart';
// import 'package:buddy_save/style/style.dart';
// import 'package:buddy_save/utils/helpers.dart';
import 'package:buddy_save/utils/typedefs.dart';

enum FutureState {
  Loading,
  Complete,
  Fail,
}

Future<T?> formSubmitDialog<T>({
  required BuildContext context,
  required Future<T> future,
  String errorMessage =
      "An unexpected error occurred and the request failed, please try again",
  String prompt = "Processing My request",
  String? successMessage,
  bool forceErrorMessage = false,
}) async {
  ValueNotifier<FutureState> isResolved = ValueNotifier(FutureState.Loading);
  final T? result = await showDialog<T>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        child: ValueListenableBuilder(
          valueListenable: isResolved,
          builder: (context, FutureState val, _) {
            return BuddyDialogScaffold(
              future: future,
              child: FutureBuilder(
                future: future,
                builder: (context, res) {
                  if (res.hasData) {
                    WidgetsBinding.instance?.addPostFrameCallback(
                      (_) {
                        Timer(
                          Duration(
                              milliseconds:
                                  successMessage == null ? 500 : 3000),
                          () {
                            Navigator.of(context).pop(res.data);
                          },
                        );
                      },
                    );
                    if (successMessage == null) {
                      return DialogMessage(
                        message: "",
                        messageType: MessageType.Pending,
                      );
                    }
                    return DialogMessage(
                      message: successMessage,
                      messageType: MessageType.Success,
                    );
                  }
                  if (res.hasError) {
                    WidgetsBinding.instance?.addPostFrameCallback(
                      (_) {
                        isResolved.value = FutureState.Complete;
                      },
                    );

                    return DialogMessage(
                      message: parseError(res.error, errorMessage),
                      messageType: MessageType.Error,
                    );
                  }
                  return DialogMessage(
                    message: prompt,
                    messageType: MessageType.Pending,
                  );
                },
              ),
              showClose: isResolved.value != FutureState.Loading,
            );
          },
        ),
        onWillPop: () async => isResolved.value == FutureState.Complete,
      );
    },
  );
  return result;
}

showSelectionSheet(
  BuildContext context, {
  String? title,
  List<SelectionData>? data,
  OnChanged<SelectionData>? onSelect,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SelectionBottomSheet(
        title: title!,
        onSelect: onSelect!,
        items: data!,
      );
    },
    backgroundColor: BuddyColors.transparent,
    isScrollControlled: true,
  );
}
