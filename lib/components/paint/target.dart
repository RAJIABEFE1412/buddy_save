import 'package:flutter/material.dart';

import 'package:buddy_save/style/colors.dart';

class TargetPaint extends CustomPainter {
  final int friends;
  TargetPaint({
    required this.friends,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = BuddyColors.white
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final paint1 = Paint()
      ..color = const Color.fromARGB(208, 117, 104, 210)
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final BorderRadius borderRadius = BorderRadius.circular(15);
    final RRect outer = borderRadius.toRRect(
      Rect.fromLTRB(0, 0, size.width, size.height),
    );
    canvas.drawRRect(
      outer,
      paint,
    );

    final BorderRadius borderRadius1 = BorderRadius.circular(15);
    final RRect outer1 = borderRadius1.toRRect(
      Rect.fromLTRB(0, 0, size.width / (friends+1), size.height),
    );
    canvas.drawRRect(
      outer1,
      paint1,
    );
  }

  @override
  bool shouldRepaint(TargetPaint oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TargetPaint oldDelegate) => false;
}
