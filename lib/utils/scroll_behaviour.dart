import 'package:flutter/widgets.dart';

class BuddyScrollAttitude extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}