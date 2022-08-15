import 'package:flutter/material.dart';
import 'package:buddy_save/utils/dimensions.dart';
import 'package:buddy_save/style/style.dart';

class BuddyText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Locale? locale;
  final bool? softWrap;
  final StrutStyle? strutStyle;
  final int? maxLines;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final bool _isEditable;

  const BuddyText(
    this.data, {
    this.style,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
    Key? key,
  })  : _isEditable = false,
        super(key: key);

  const BuddyText.editable(
    this.data, {
    this.style,
    this.textAlign,
    this.locale,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.strutStyle,
    this.textDirection,
  }) : _isEditable = true;

  @override
  Widget build(BuildContext context) {
    final _style =
        style != null ? style : Theme.of(context).textTheme.bodyText1;
    final _fontSize = style != null ? _style?.fontSize ?? 45.0 : 45.0;
    final _fontWeight =
        style != null ? _style?.fontWeight ?? FontWeight.w100 : FontWeight.w100;
    final fontSizer = BuddyScaleUtil(context).fontSizer;
    if (_isEditable) {
      return EditableText(
        toolbarOptions: ToolbarOptions(
          copy: true,
        ),
        readOnly: true,
        controller: TextEditingController(
          text: data,
        ),
        focusNode: FocusNode(),
        style: _style?.copyWith(
              fontSize: fontSizer.sp(_fontSize),
              fontWeight: _fontWeight,
            ) ??
            TextStyle(
              fontSize: fontSizer.sp(_fontSize),
              fontWeight: _fontWeight,
            ),
        cursorColor: BuddyColors.purple,
        backgroundCursorColor: BuddyColors.transparent,
        strutStyle: strutStyle,
        textAlign: textAlign ?? TextAlign.start,
        locale: locale,
        maxLines: maxLines,
        textDirection: textDirection,
        textWidthBasis: TextWidthBasis.parent,
      );
    }
    return Text(
      data,
      style: _style?.copyWith(
        fontSize: fontSizer.sp(_fontSize),
      ),
      strutStyle: strutStyle,
      textAlign: textAlign,
      locale: locale,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textDirection: textDirection,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
