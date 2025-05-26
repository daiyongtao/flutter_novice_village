import 'package:flutter/material.dart';
import 'package:flutter_novice_village/paper/conform_dialog.dart';
import 'line.dart';
import 'paper_app_bar.dart';
import 'paper_painter.dart';

/*画板绘制页*/
class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<StatefulWidget> createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  final List<Line> _lines = []; // 线列表（每一条线抽象成Line模型，每一条线由多个点(line.points)组成）
  int _curColorIndex = 0; // 当前线条绘制颜色index
  int _curStrokeWidthIndex = 0; // 当前线条粗细index

  /// 支持的颜色
  final List<Color> supportColors = [
    Colors.black, Colors.red, Colors.orange,
    Colors.yellow, Colors.green, Colors.blue,
    Colors.indigo, Colors.purple,
  ];

  // 支持的粗细
  final List<double> supportStrokeWidths = [1, 2, 4, 6, 8, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaperAppBar(onClear: _showClearDialog, lines: _lines),
      body: GestureDetector(
        onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
        child: CustomPaint(
          painter: PaperPainter(lines: _lines),
          child: ConstrainedBox(constraints: const BoxConstraints.expand()),
        )
      )
    );
  }

  // 清除
  void _clear() {
    _lines.clear();
    _closeDialog(context);
    setState(() {
    });
  }

  void _showClearDialog() {
    String msg = "您的当前操作会清空绘制内容，是否确定删除!";
    showDialog(
        context: context,
        builder: (ctx) => ConformDailog(
            title: "清空提示",
            msg: msg,
            onConform: _clear
        )
    );
  }

  // 关闭弹窗
  void _closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  /// 拖拽开始，添加当前画线的第一个点
  void _onPanStart(DragStartDetails details) {
    _lines.add(Line(points: [details.localPosition]));
  }

  /// 拖拽中，将点添加进line数组中
  void _onPanUpdate(DragUpdateDetails details) {
    _lines.last.points.add(details.localPosition);
    setState(() {

    });
  }
}