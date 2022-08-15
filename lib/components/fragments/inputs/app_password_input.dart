import 'package:flutter/material.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/utils/typedefs.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final OnValidate<String?>? validator;
  final String? hintText;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const PasswordTextField({
    Key? key,
    this.controller,
    required this.validator,
    this.hintText,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField>
    with WidgetsBindingObserver {
  final ValueNotifier<bool> _isObscured = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isObscured,
      builder: (_, bool obscured, __) {
        return BuddyTextField(
          validator: widget.validator,
          controller: widget.ctrl,
          obscureText: obscured,
          hintText: widget.hintText ?? "Password",
          suffixIcon: IconButton(
            icon: Icon(
              obscured ? Icons.visibility : Icons.visibility_off,
              color: BuddyColors.darkGray,
            ),
            onPressed: () {
              _isObscured.value = !obscured;
            },
          ),
        );
      },
    );
  }
}
