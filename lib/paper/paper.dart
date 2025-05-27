import 'package:flutter/material.dart';
import 'package:flutter_novice_village/paper/conform_dialog.dart';
import 'package:flutter_novice_village/paper/selector/color_selector.dart';
import 'package:flutter_novice_village/paper/selector/stroke_width_selector.dart';
import 'line.dart';
import 'paper_app_bar/paper_app_bar.dart';
import 'paper_painter.dart';

/*画板绘制页*/
class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<StatefulWidget> createState() => _PaperState();
}

class _PaperState extends State<Paper> with AutomaticKeepAliveClientMixin {
  final List<Line> _lines = []; // 线列表（每一条线抽象成Line模型，每一条线由多个点(line.points)组成）
  int _curColorIndex = 0; // 当前线条绘制颜色index
  int _curStrokeWidthIndex = 0; // 当前线条粗细index

  /// 支持的颜色
  final List<Color> supportColors = [
    Colors.black, Colors.red, Colors.orange,
    Colors.yellow, Colors.green, Colors.blue,
    Colors.indigo, Colors.purple, Colors.cyan,
    Colors.brown, Colors.grey
  ];

  // 支持的粗细
  final List<double> supportStrokeWidths = [1, 2, 4, 6, 8, 10];

  // 后悔药（向前回退，撤销回退）
  final List<Line> _historyLines = [];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaperAppBar(
        onClear: _showClearDialog,
        lines: _lines,
        onBack: _lines.isEmpty ? null : _back,
        onRevocation: _historyLines.isEmpty ? null : _revocation),
      body: Stack(
        children: [
          GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
              child: CustomPaint(
                painter: PaperPainter(lines: _lines),
                child: ConstrainedBox(constraints: const BoxConstraints.expand()),
              )
          ),
          Positioned(
              bottom: 10,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(child: ColorSelector(
                      supportColors: supportColors,
                      onSelect: _onSelectColor,
                      index: _curColorIndex)),
                  StrokeWidthSelector(
                      supportStrokeWidths: supportStrokeWidths,
                      color: supportColors[_curColorIndex],
                      onSelect: _onSelectStrokeWidth,
                      index: _curStrokeWidthIndex)
                ],
              )
          ),
        ],
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

  // 回退
  void _back() {
    var lastLine = _lines.removeLast();
    _historyLines.add(lastLine);
    setState(() { });
  }

  // 撤销回退
  void _revocation() {
    var lastLine = _historyLines.removeLast();
    _lines.add(lastLine);
    setState(() { });
  }

  // 关闭弹窗
  void _closeDialog(BuildContext context) {
    Navigator.pop(context);
  }

  /// 拖拽开始，添加当前画线的第一个点
  void _onPanStart(DragStartDetails details) {
    _lines.add(Line(
      points: [details.localPosition],
      strokeWidth: supportStrokeWidths[_curStrokeWidthIndex],
      color: supportColors[_curColorIndex]
    ));
  }

  /// 拖拽中，将点添加进line数组中
  void _onPanUpdate(DragUpdateDetails details) {
    Offset point = details.localPosition;
    double distance = (_lines.last.points.last - point).distance;
    if (distance > 5) {
      _lines.last.points.add(details.localPosition);
      // print("哈哈 - ${details.localPosition}");
      setState(() { });
    }
  }

  // 粗细选择器点击事件
  void _onSelectStrokeWidth(int index) {
    if (index != _curStrokeWidthIndex) {
      setState(() {
        _curStrokeWidthIndex = index;
      });
    }
  }

  // 颜色选择器点击事件
  void _onSelectColor(int index) {
    if (index != _curColorIndex) {
      setState(() {
        _curColorIndex = index;
      });
    }
  }
}