import 'dart:ui';

import 'package:b2w/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CircleProgressPainter extends CustomPainter {
  final double percentage;
  final Color color;

  CircleProgressPainter({
    required this.percentage,
    required this.color,
  });


  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 15.0;

    final backgroundPaint = Paint()
      ..color = Colors.white12
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width - strokeWidth) / 2;

    canvas.drawCircle(center, radius, backgroundPaint);

    double sweepAngle = 2 * 3.1415926 * percentage;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -3.1415926 / 2, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}