
import 'package:flutter/material.dart';

class AnimateText extends StatefulWidget {
  final String text;
  const AnimateText({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => _FadTextState();
}

class _FadTextState extends State<AnimateText> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;   // 透明度动画
  late Animation<Offset> position;  // 路径动画
  late Animation<double> scale;     // 缩放动画

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    opacity = Tween(begin: 1.0, end: 0.0).animate(controller); // tag1
    position = Tween<Offset>(begin: Offset(0, 2), end: Offset.zero).animate(controller); // tag2
    scale = Tween(begin: 1.0, end: 0.8).animate(controller); // tag3
    controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimateText oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.forward(from: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition( // 缩放动画
      scale: scale,
      child: SlideTransition( // 路径动画
          position: position,
          child: FadeTransition( // 透明度动画
            opacity: opacity,
            child: Text(widget.text),
          )),
    );
  }
}