import 'package:flutter/material.dart';
import 'paper_app_bar.dart';
import 'paper_painter.dart';

/*画板绘制页*/
class Paper extends StatefulWidget {
  const Paper({super.key});

  @override
  State<StatefulWidget> createState() => _PaperState();
}

class _PaperState extends State<Paper> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaperAppBar(onClear: _clear),
      body: CustomPaint(
        painter: PaperPainter(),
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      ),
    );
  }

  // 清除
  void _clear() {}
}