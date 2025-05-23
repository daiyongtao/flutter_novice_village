import 'package:flutter/material.dart';

// 可以通过自定义一个class，也可以通过函数直接返回一个Stack
/*自定义view：背景颜色 + 中间大文字*/
class ResultNotice extends StatefulWidget {
  final String info;
  final Color color;
  const ResultNotice({super.key, required this.info, required this.color});

  @override
  State<StatefulWidget> createState() => _ResultNoticeState();
}

class _ResultNoticeState extends State<ResultNotice> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)
    );
    animationController.forward(); // 启动动画器
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
        alignment: Alignment.center,
        color: widget.color,
        child: AnimatedBuilder(
            animation: animationController,
            builder: (_, child) => Text(
              widget.info,
              style: TextStyle(
                  fontSize: 54 * (animationController.value),
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            )
        )
    ));
  }

  @override
  void didUpdateWidget(covariant ResultNotice oldWidget) {
    animationController.forward(from: 0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

// StatefulWidget  和 StatelessWidget
// 选取 StatefulWidget 的标准 -----：
// 当前组件展示区域，在交互中需要改变内容；且外界无需在意内部状态数据
