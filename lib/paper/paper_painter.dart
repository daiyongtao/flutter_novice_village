
import 'dart:ui';
import 'package:flutter/cupertino.dart';

/*画板内容*/
class PaperPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> points = const [
      Offset(100, 100),
      Offset(100, 150),
      Offset(150, 150),
      Offset(200, 100),
      Offset(300, 300)
    ];
    Paint paint = Paint();
    paint.strokeWidth = 10;
    // canvas.drawPoints(PointMode.points, points, paint);
    // PointMode.points：绘制一个一个点
    // PointMode.lines：将点分成若干对，每对连成线（如果有5个点，最后一个单独的点不会画出来）
    // PointMode.polygon：会将所有的点，依次连接
    canvas.drawPoints(PointMode.points, points, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}