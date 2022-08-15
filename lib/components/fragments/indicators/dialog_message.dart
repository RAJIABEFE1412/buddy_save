import 'package:flutter/material.dart';
import 'package:buddy_save/components/fragments/buttons/app_button.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/colors.dart';

import 'app_loader.dart';

enum MessageType {
  Error,
  Warning,
  Success,
  Info,
  Pending,
}

class DialogMessage extends StatelessWidget {
  final dynamic message;
  final MessageType messageType;
  final String? route;
  final TextAlign textAlign;
  final bool _isConfirm;
  final bool _isAction;

  DialogMessage({
    required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
    this.route,
  })  : _isConfirm = false,
        _isAction = false;

  DialogMessage.confirm({
    required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
    required this.route,
  })  : _isConfirm = true,
        _isAction = false;
  DialogMessage.action({
    required this.message,
    this.messageType = MessageType.Warning,
    this.textAlign = TextAlign.center,
    required this.route,
  })  : _isAction = true,
        _isConfirm = false;
  String _parsedMessage() {
    if (message is String) {
      return message;
    } else if (message is Map || message is List) {
      final List<String> messageArr = message is Map
          ? message.values.map((it) => "$it").toList()
          : message.map((it) => "$it").toList();
      return messageArr.join("; ");
    } else {
      return "";
    }
  }

  Widget _messageIcon() {
    switch (messageType) {
      case MessageType.Error:
        return Icon(
          Icons.error_outline,
          size: 30,
          color: BuddyColors.red,
        );

      case MessageType.Success:
        return Icon(
          Icons.sentiment_satisfied,
          size: 30,
          color: BuddyColors.green,
        );

      case MessageType.Warning:
        return Icon(
          Icons.warning,
          size: 30,
          color: BuddyColors.red.withGreen(100),
        );

      case MessageType.Pending:
        return const Apploader();

      default:
        return Icon(
          Icons.notifications,
          size: 30,
          color: BuddyColors.black,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: _isConfirm || _isAction
          ? CrossAxisAlignment.stretch
          : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (!_isConfirm) _messageIcon(),
        const BuddySizedBox(height: 1),
        Flexible(
          child: BuddyText(
            _parsedMessage(),
            textAlign: TextAlign.center,
          ),
        ),
        if (_isConfirm || _isAction) const BuddySizedBox(height: 3),
        if (_isConfirm)
          BuddyButton(
            text: "Proceed",
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        if (_isAction)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuddyButton(
                text: "Proceed",
                color: BuddyColors.red,
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              BuddyButton(
                text: "Cancel",
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          )
      ],
    );
  }
}
