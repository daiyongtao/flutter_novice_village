import 'package:flutter/material.dart';

class Line {
  // 绘制点数组
  List<Offset> points;
  // 绘制的颜色
  Color color;
  // 线条粗细
  double strokeWidth;

  Line({
    required this.points,
    this.color = Colors.black,
    this.strokeWidth = 2
  });
}