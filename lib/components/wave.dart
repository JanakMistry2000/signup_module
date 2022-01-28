import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawCurve extends CustomPainter {
  Color backgroundColor; // Specify the color of wave

  DrawCurve({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = backgroundColor;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.9);
    path.cubicTo(0, size.height, size.width * -0.15, size.height * -0.3,
        size.width * 0.45, size.height * 0.65); //This will create first arc
    path.cubicTo(size.width * 0.75, size.height * 0.9, size.width * 0.85,
        size.height * -0.3, size.width, size.height * 0.8); //For second arc.
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
