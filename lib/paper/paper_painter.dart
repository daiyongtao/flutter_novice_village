
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_novice_village/paper/line.dart';

/*画板内容*/
class PaperPainter extends CustomPainter {
  late Paint _paint;
  final List<Line> lines;

  PaperPainter({required this.lines}) {
    _paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < lines.length; i++) {
      _drawLine(canvas, lines[i]);
    }
  }

  /// 根据点集绘制线条
  void _drawLine(Canvas canvas, Line line) {
    _paint.color = line.color; // 画笔颜色
    _paint.strokeWidth = line.strokeWidth; // 画笔粗细
    canvas.drawPoints(PointMode.polygon, line.points, _paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}