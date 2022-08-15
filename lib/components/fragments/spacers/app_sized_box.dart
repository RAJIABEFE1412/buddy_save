import 'package:flutter/widgets.dart';
import 'package:buddy_save/utils/dimensions.dart';

class BuddySizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const BuddySizedBox({this.height = 0, this.width = 0, this.child});

  @override
  Widget build(BuildContext context) {
    final sizer = BuddyScaleUtil(context).sizer;
    return SizedBox(
      height: sizer.setHeight(height),
      width: sizer.setWidth(width),
      child: child,
    );
  }
}
