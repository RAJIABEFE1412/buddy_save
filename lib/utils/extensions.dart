import 'package:flutter/widgets.dart';


import 'dimensions.dart';

extension WidgetExtensions on Widget {
  List<Widget> operator *(int count) {
    return List.generate(count, (_) => this);
  }
}

extension ScaleExtension on BuildContext {
  BuddyScaleUtil get scaler {
    return BuddyScaleUtil(this);
  }
}