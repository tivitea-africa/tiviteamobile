import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashGap;
  final Color color;

  DottedLinePainter({
    this.dashWidth = 4,
    this.dashGap = 7,
    this.color = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DottedLine extends StatelessWidget {
  final double height;

  const DottedLine({super.key, this.height = 1});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: DottedLinePainter(),
    );
  }
}
