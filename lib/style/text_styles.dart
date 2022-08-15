import 'package:buddy_save/style/colors.dart';
import 'package:flutter/widgets.dart' show TextStyle, FontWeight;

class BuddyFonts {
  ///
  /// FONT-FAMILY MARK PRO
  ///
  static const markPro = "MarkPro";
}

class BuddyTextStyle {
  static const TextStyle light = TextStyle(
    fontFamily: BuddyFonts.markPro,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: BuddyFonts.markPro,
  );

  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: BuddyFonts.markPro,
    color: BuddyColors.black,
  );

  static final TextStyle black = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: BuddyFonts.markPro,
  );
  static final TextStyle notePadWhite = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: BuddyFonts.markPro,
    fontSize: 12,
    color: BuddyColors.white,
  );
  static final TextStyle notePadSmallWhite = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: BuddyFonts.markPro,
    fontSize: 10,
    color: BuddyColors.white,
  );
}
