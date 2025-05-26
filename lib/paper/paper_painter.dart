
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/*画板内容*/
class PaperPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> points = const [
      Offset(100, 100),
      Offset(100, 150),
      Offset(150, 150),
      Offset(200, 100)
    ];
    Paint paint = Paint();
    paint.strokeWidth = 2; // 画笔粗细
    paint.color = Colors.green; // 画笔颜色
    paint.strokeCap = StrokeCap.round; // 使线头圆润
    /**
        canvas.drawPoints(PointMode.points, points, paint);
        PointMode.points：绘制一个一个点
        PointMode.lines：将点分成若干对，每对连成线（如果有5个点，最后一个单独的点不会画出来）
        PointMode.polygon：会将所有的点，依次连接
        */
        canvas.drawPoints(PointMode.polygon, points, paint);

    // 画圆
    canvas.drawCircle(Offset(100, 300), 50, paint);
    paint.style = PaintingStyle.stroke; // 描边
    canvas.drawCircle(Offset(100, 400), 50, paint);

    // 画矩形
    Rect rect = Rect.fromCenter(center: Offset(250, 300), width: 40, height: 60);
    canvas.drawRect(rect, paint);
    paint.style = PaintingStyle.fill; // 填充
    RRect rRect = RRect.fromRectXY(rect.translate(0, 100), 8, 8);
    canvas.drawRRect(rRect, paint);

    // 绘制椭圆（如果width和height相同，就是圆）
    Rect overRect = Rect.fromCenter(center: Offset(350, 300), width: 80, height: 60);
    canvas.drawOval(overRect, paint);

    // 绘制圆弧
    paint.style = PaintingStyle.stroke; // 描边
    canvas.drawArc(overRect.translate(0, 100), pi, pi*1.2, true, paint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}