import 'dart:math';

import 'package:flutter/material.dart';

class ProgressArc extends CustomPainter {
  double? arc;
  Color? progressColor;
  bool? isBackground;

  ProgressArc({this.arc, this.progressColor, this.isBackground});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final rect = Rect.fromLTRB(0, 0, 200, 200);
    final startAngle = -pi;
    final sweepAngle = arc! != null ? arc : pi;
    final userCenter = false;
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = progressColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    if (isBackground!) {}
    canvas.drawArc(rect, startAngle, sweepAngle!, userCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
