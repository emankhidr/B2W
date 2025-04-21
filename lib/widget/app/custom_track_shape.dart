import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTrackShape extends RangeSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 8.0;
    final double trackLeft = offset.dx + 16; // padding from left
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 32; // padding from right

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset startThumbCenter,
        required Offset endThumbCenter,
        bool isEnabled = false,
        bool isDiscrete = false,
      }) {
    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final Paint activePaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.purple
      ..style = PaintingStyle.fill;

    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.purple.shade100
      ..style = PaintingStyle.fill;

    final left = Offset(trackRect.left, trackRect.center.dy);
    final right = Offset(trackRect.right, trackRect.center.dy);

    final activeStart = Offset(startThumbCenter.dx, trackRect.center.dy);
    final activeEnd = Offset(endThumbCenter.dx, trackRect.center.dy);

    // Inactive left track
    context.canvas.drawRect(
      Rect.fromPoints(left, activeStart).deflate(-trackRect.height / 2),
      inactivePaint,
    );

    // Active track
    context.canvas.drawRect(
      Rect.fromPoints(activeStart, activeEnd).deflate(-trackRect.height / 2),
      activePaint,
    );

    // Inactive right track
    context.canvas.drawRect(
      Rect.fromPoints(activeEnd, right).deflate(-trackRect.height / 2),
      inactivePaint,
    );
  }
}