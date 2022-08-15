import 'package:flutter/material.dart';

class SelectionData<T> {
  T selection;
  String title;
  IconData? data;

  SelectionData({required this.selection, required this.title, this.data})
      : assert(selection != null),
        assert(title != null);
}
