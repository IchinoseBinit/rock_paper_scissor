import 'package:flutter/material.dart';

class PaperPainter extends CustomPainter {
  final double value;

  PaperPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.grey.shade300;
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2 - (value * 22), size.height);
    path.lineTo(size.width / 2, size.height * (1 - (value)));
    path.lineTo(size.width / 2 + (value * 22), size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
