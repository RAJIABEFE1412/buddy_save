import 'package:buddy_save/utils/intl_formatter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:buddy_save/models/podos/focus.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/extensions.dart';
import 'package:buddy_save/utils/typedefs.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuddyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isEnabled;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final bool? showLabel;
  final Function? onTap;
  final bool? obscureText;
  final String? hintText;
  final Widget? suffix;
  final prefixIconConstraints;
  final prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final TextAlignVertical? textAlignVertical;
  final OnValidate<String?>? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String? semanticsLabel;
  final bool _expands;
  final bool _amount;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const BuddyTextField({
    Key? key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.textAlignVertical,
    this.isEnabled = true,
    this.inputFormatters = const [],
    this.onTap,
    this.showLabel = true,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  })  : this._expands = false,
        this._amount = false,
        super(key: key);
  const BuddyTextField.amount({
    Key? key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.textAlignVertical,
    this.isEnabled = true,
    this.inputFormatters = const [],
    this.onTap,
    this.showLabel = true,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  })  : this._expands = false,
        this._amount = true,
        super(key: key);

  const BuddyTextField.expand({
    Key? key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.textAlignVertical,
    this.isEnabled,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.inputFormatters = const [],
    this.onTap,
    this.showLabel = true,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  })  : this._expands = true,
        this._amount = false,
        super(key: key);

  @override
  _BuddyTextFieldState createState() => _BuddyTextFieldState();
}

class _BuddyTextFieldState extends State<BuddyTextField>
    with WidgetsBindingObserver {
  final _inputFocus = FocusNode();
  final ValueNotifier<FocusState> _hasFocus = ValueNotifier(FocusState());

  @override
  void initState() {
    super.initState();
    _inputFocus.addListener(
      () {
        _hasFocus.value = FocusState(
          hasText: widget.ctrl != null && (widget.ctrl.text.isNotEmpty),
          isFocused: _inputFocus.hasFocus,
        );
      },
    );
  }

  InputDecoration get decoration {
    return InputDecoration(
      filled: false,
      fillColor: BuddyColors.transparent,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: BuddyColors.primary,
          width: 0,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: BuddyColors.primary,
          width: 0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: BuddyColors.primary,
          width: 0,
        ),
      ),
      // suffixIcon: Icon(
      //   Icons.navigation_rounded,
      //   color: Colors.red,
      // ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: BuddyColors.red,
          width: 0,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: BuddyColors.red,
          width: 0,
        ),
      ),
      labelText: widget.hintText ?? "",
      labelStyle: TextStyle(
        color: BuddyColors.black.withOpacity(.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return IgnorePointer(
      ignoring: !(widget.isEnabled ?? true),
      child: Semantics(
        label: widget.semanticsLabel ?? "Input Field",
        child: ValueListenableBuilder(
          valueListenable: _hasFocus,
          builder: (context, FocusState value, child) {
            return InkWell(
              onTap: () => FocusScope.of(context).requestFocus(_inputFocus),
              child: Container(
                padding:
                    scaler.insets.symmetric(vertical: value.hasError ? 0 : .5),
                margin: scaler.insets.zero,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: value.hasError
                        ? BuddyColors.red
                        : value.isFocused
                            ? BuddyColors.transparent
                            : BuddyColors.wine.withOpacity(0.0),
                  ),
                  borderRadius: BorderRadius.circular(
                    scaler.fontSizer.sp(15),
                  ),
                ),
                child: child,
              ),
            );
          },
          child: TextFormField(
            showCursor: true,
            textAlign: widget.textAlign ?? TextAlign.start,
            textAlignVertical: widget.textAlignVertical,
            focusNode: _inputFocus,
            onTap: () {
              FocusScope.of(context).requestFocus(_inputFocus);
            },
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            textCapitalization:
                widget.textCapitalization ?? TextCapitalization.none,
            style: widget.style ??
                BuddyTextStyle.bold.copyWith(fontSize: scaler.fontSizer.sp(55)),
            maxLength: widget.maxLength,
            controller: widget.ctrl,
            enabled: true,
            obscureText: widget.obscureText ?? false,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            inputFormatters: widget._amount
                ? [AmountFormatter(), ...widget.inputFormatters]
                : widget.inputFormatters,
            maxLines: widget.maxLines ?? 1,
            cursorColor: BuddyColors.black,
            onChanged: widget.onChanged,
            decoration: decoration.copyWith(
              alignLabelWithHint: widget._expands,
              prefixIcon: widget._amount
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12.0, right:6.0,),
                      child: SvgPicture.asset("assets/svgs/naira.svg"),
                    )
                  : widget.prefixIcon,
              prefixIconConstraints: widget.prefixIconConstraints,
              labelStyle: BuddyTextStyle.light.copyWith(
                fontSize: scaler.fontSizer.sp(60),
                color: BuddyColors.black.withOpacity(.4),
              ),
              suffix: widget.suffix,
              suffixIcon:
                  widget.suffixIcon != null ? widget.suffixIcon : Offstage(),
              prefix: widget.prefix,
              counter: null,
              contentPadding: scaler.insets.symmetric(
                horizontal: 5,
                vertical: 2.0,
              ),
            ),
            validator: (String? text) {
              if (widget.validator != null) {
                final error = widget.validator!(text);
                _hasFocus.value = FocusState(
                  hasError: error != null,
                  hasText: _hasFocus.value.hasText,
                  isFocused: _hasFocus.value.isFocused,
                );
                return error;
              }
              _hasFocus.value = FocusState(
                hasError: false,
                hasText: _hasFocus.value.hasText,
                isFocused: _hasFocus.value.isFocused,
              );
              return null;
            },
          ),
        ),
      ),
    );
  }
}
